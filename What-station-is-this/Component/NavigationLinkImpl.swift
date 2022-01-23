//
//  NavigationLinkImpl.swift
//  What-station-is-this
//
//  Created by 신희재 on 2022/01/23.
//
// IOS 14.5 이후로 네비게이션 링크로 생성된 view가 저절로 pop되는 이슈 발생.
// 해당 버그를 해결하기 위해 네비게이션 뷰를 오버라이딩하여 사용.
// Ref: https://gist.github.com/Arutyun2312/a0dab7eecaa84bde99c435fecae76274

import SwiftUI

struct NavigationLink: View {
    fileprivate init<T: View>(body: T) {
        self.body = .init(body)
    }

    let body: AnyView
}

private struct NavigationLinkImpl<Destination: View, Label: View>: View {
    let destination: () -> Destination?
    @State var isActive = false
    @ViewBuilder let label: () -> Label

    var body: some View {
        NavigationLinkImpl1(destination: destination, isActive: $isActive, label: label)
    }
}

private var navs: [String: UINavigationController] = [:]
private struct NavigationLinkImpl1<Destination: View, Label: View>: View {
    let destination: () -> Destination
    @Binding var isActive: Bool
    @ViewBuilder let label: () -> Label
    @State var model = Impl.Model()
    @Environment(\.navigationID) var navigationID

    var body: some View {
        if navigationID == EnvironmentValues.NavigationViewKey.defaultValue {
            Text("Navigation View not detected")
        } else {
            Button(action: action, label: label)
                .overlay(Impl(isActive: $isActive, createDestination: destination, model: model, navigationID: navigationID).frame(width: 0, height: 0))
        }
    }

    struct Impl: UIViewControllerRepresentable {
        typealias UIViewControllerType = UIViewController

        @Binding var isActive: Bool
        let createDestination: () -> Destination
        let model: Model
        let navigationID: String

        func makeUIViewController(context: Context) -> UIViewControllerType {
            let controller = UIViewController()
            DispatchQueue.main.async { _ = obtainNav(controller) }
            return controller
        }

        func updateUIViewController(_ controller: UIViewController, context: Context) {
            guard let nav = obtainNav(controller) else { return }
            if isActive {
                model.push(createDestination: createDestination)
            } else {
                model.pop()
            }
            if isActive, model.destination.map(nav.viewControllers.contains) != true { // detect pop
                DispatchQueue.main.async {
                    isActive = false
                    model.pop()
                }
            }
        }

        func obtainNav(_ controller: UIViewController) -> UINavigationController? {
            guard let nav = model.nav ?? navs[navigationID] ?? controller.navigationController else { return nil }
            model.nav = nav
            navs[navigationID] = nav
            return nav
        }

        final class Model: ObservableObject {
            @Published var nav: UINavigationController!
            private(set) var destination: UIViewController?

            func push(createDestination: () -> Destination) {
                if destination == nil {
                    let dest = UIHostingController<Destination>(rootView: createDestination())
                    nav.pushViewController(dest, animated: true)
                    destination = dest
                }
            }

            func pop() {
                if let dest = destination, let i = nav?.viewControllers.lastIndex(of: dest) {
                    var views = nav.viewControllers
                    views.remove(at: i)
                    nav.setViewControllers(views, animated: true)
                }
                destination = nil
            }

            deinit { // deinit is not always called in main thread
                guard let nav = nav, let destination = destination else { return }
                DispatchQueue.main.async {
                    if let i = nav.viewControllers.lastIndex(of: destination) {
                        var views = nav.viewControllers
                        views.remove(at: i)
                        nav.setViewControllers(views, animated: true)
                    }
                }
            }
        }
    }

    func action() {
        if isActive { // supposed to be false, but pop wasn't detected. Therefore force push
            guard model.nav != nil else { return } // nav hasn't been inited
            model.pop()
            model.push(createDestination: destination)
        } else {
            isActive = true
        }
    }
}

struct NavigationView<Content: View>: View {
    @ViewBuilder var content: () -> Content
    @State var id = ProcessInfo.processInfo.globallyUniqueString

    var body: some View {
        SwiftUI.NavigationView {
            content()
                .overlay(NavigationLink(destination: EmptyView()) {}) // ensure nav can be found
        }
        .environment(\.navigationID, id)
        .onDisappear { navs[id] = nil }
    }
}

extension EnvironmentValues {
    struct NavigationViewKey: EnvironmentKey {
        static var defaultValue = ""
    }

    fileprivate var navigationID: NavigationViewKey.Value {
        get { self[NavigationViewKey.self] }
        set { self[NavigationViewKey.self] = newValue }
    }
}

extension NavigationLink {
    init<Destination: View, Label: View>(destination: @autoclosure @escaping () -> Destination, @ViewBuilder label: @escaping () -> Label) {
        self.init(body: NavigationLinkImpl(destination: destination, label: label))
    }

    init<Destination: View, Label: View>(destination: @autoclosure @escaping () -> Destination, isActive: Binding<Bool>, @ViewBuilder label: @escaping () -> Label) {
        self.init(body: NavigationLinkImpl1(destination: destination, isActive: isActive, label: label))
    }

    init<Destination: View>(_ text: String, destination: @autoclosure @escaping () -> Destination, isActive: Binding<Bool>) {
        self.init(destination: destination(), isActive: isActive) { Text(text) }
    }

    init<Destination: View>(_ text: String, destination: @autoclosure @escaping () -> Destination) {
        self.init(destination: destination()) { Text(text) }
    }

    init<Destination: View>(destination: @autoclosure @escaping () -> Destination, isActive: Binding<Bool>) {
        self.init(destination: destination(), isActive: isActive) {}
    }
}
