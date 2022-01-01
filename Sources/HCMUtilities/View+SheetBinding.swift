//
//  File.swift
//  
//
//  Created by Hunter Meyer on 12/31/21.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
fileprivate struct SheetBinding<Item: Identifiable, SheetContent: View>: ViewModifier {
    
    @Binding var item: Item?

    let onDismiss: (() -> Void)?
    @ViewBuilder let sheetContent: (Binding<Item>) -> SheetContent

    @ViewBuilder func body(content: Content) -> some View {
        content
            .sheet(item: self.$item, onDismiss: self.onDismiss) { newItem in
                self.sheetContent(Binding {
                    newItem
                } set: {
                    self.item = $0
                }) // sheetContent
            } // .sheet
    } // body
} // SheetBinding

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    /// Presents a sheet using the given item as a data source for the sheet’s content.
    ///
    /// This differs from other sheet implementations with a custom `Binding<Item?>` in that the content closure accepts a `Binding<Item>`, as opposed to an `Item`.  This allows you to inject your `Binding<Item>` into your sheet's content.
    public func sheet<Item, Content>(item: Binding<Item?>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping (Binding<Item>) -> Content) -> some View where Item: Identifiable, Content: View {
        self.modifier(SheetBinding(item: item, onDismiss: onDismiss, sheetContent: content))
    } // View.sheet(item:onDimiss:content:)
}
