﻿#pragma checksum "..\..\..\..\Windows\OrderWindow.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "32540976CFA55F57F06F30A4FBCC7EA9BF430346"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using FragrantWorld.Windows;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace FragrantWorld.Windows {
    
    
    /// <summary>
    /// OrderWindow
    /// </summary>
    public partial class OrderWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector, System.Windows.Markup.IStyleConnector {
        
        
        #line 16 "..\..\..\..\Windows\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock userInfoTextBlock;
        
        #line default
        #line hidden
        
        
        #line 17 "..\..\..\..\Windows\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button returnButton;
        
        #line default
        #line hidden
        
        
        #line 20 "..\..\..\..\Windows\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListBox productsListBox;
        
        #line default
        #line hidden
        
        
        #line 46 "..\..\..\..\Windows\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox pickupPointSelectionComboBox;
        
        #line default
        #line hidden
        
        
        #line 49 "..\..\..\..\Windows\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock orderNumberTextBlock;
        
        #line default
        #line hidden
        
        
        #line 53 "..\..\..\..\Windows\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock receiptCodeTextBlock;
        
        #line default
        #line hidden
        
        
        #line 57 "..\..\..\..\Windows\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock priceTextBlock;
        
        #line default
        #line hidden
        
        
        #line 60 "..\..\..\..\Windows\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button orderButton;
        
        #line default
        #line hidden
        
        
        #line 61 "..\..\..\..\Windows\OrderWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button saveTicketButton;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "8.0.8.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/FragrantWorld;component/windows/orderwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\Windows\OrderWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "8.0.8.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.userInfoTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 2:
            this.returnButton = ((System.Windows.Controls.Button)(target));
            
            #line 17 "..\..\..\..\Windows\OrderWindow.xaml"
            this.returnButton.Click += new System.Windows.RoutedEventHandler(this.ReturnButton_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.productsListBox = ((System.Windows.Controls.ListBox)(target));
            return;
            case 5:
            this.pickupPointSelectionComboBox = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 6:
            this.orderNumberTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 7:
            this.receiptCodeTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 8:
            this.priceTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 9:
            this.orderButton = ((System.Windows.Controls.Button)(target));
            
            #line 60 "..\..\..\..\Windows\OrderWindow.xaml"
            this.orderButton.Click += new System.Windows.RoutedEventHandler(this.OrderButton_Click);
            
            #line default
            #line hidden
            return;
            case 10:
            this.saveTicketButton = ((System.Windows.Controls.Button)(target));
            
            #line 61 "..\..\..\..\Windows\OrderWindow.xaml"
            this.saveTicketButton.Click += new System.Windows.RoutedEventHandler(this.SaveTicketButton_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "8.0.8.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        void System.Windows.Markup.IStyleConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 4:
            
            #line 37 "..\..\..\..\Windows\OrderWindow.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.RemoveButton_Click);
            
            #line default
            #line hidden
            break;
            }
        }
    }
}
