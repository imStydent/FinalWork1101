   M S B A M L   `   `   `  ����H  DFragrantWorld, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:FragrantWorld.WindowsFragrantWorld.Windows  5   	   '    !FragrantWorld.Windows.OrderWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   5local#clr-namespace:FragrantWorld.Windows     5   	     � Title$+  %Формирование заказа��5   	   $	��490��6%   $	��800��62    � WindowStartupLocation$ CenterScreen=�6>   $��Comic Sans MS)�6c   $	��490��5	   	   $	��800��6    � SizeToContent$ WidthAndHeight=�6(    � Icon$ /Pictures/icon.ico��6G   .��5
      �� .+�5   
   � $��21��6   $	��Top=�6    .+�5      �� $��/Pictures/logo.png��6   $
��5, 0q�60   �� 5      $&�� ООО Ароматный мир��6   $��0, 2.5q�61   5      ]� 5   
   $��Right=�6   .+�5      �� -   5        $��userInfoTextBlock��5      $��10, 0q�61   �� 5      -   5         ��Name$ returnButton��5      $��
Назад��6+   6;   5      �� 5   
   $
��Auto=�6   .��5      �� -   5        $��productsListBox��5      ��5      �� 5      .R�5      �� $��1q�6!   
���   �$��5,0,0,0q�6I    �� Padding$ 3q�6Z   ._�5      �� $	��700��6)    � 	Resources 5   "    �� 
TargetType �� Property	 �� Value��%\   '��       �� 5   &   " ��6,   .�5   *   ��  � ��	 6G   �� *Color+5   '   5   #   .+�5   "   �� $
��Bold"�6I   ��6,   �� *ProductName+6I   �� 5   "   ��6,   �� *ProductDescription+�� 5    "   ��6,   �� 
 �� StringFormat$%
 Производитель: {0}�� �� Path$ ProductManufacturer�]� 5!   "   .+�5"   &   �� $��
Цена: ��60   �� 5#   &   $�� ��60   �� 5$   &   ��60   �� $
 {0:0.00} руб��$ ProductCost��� 5%   &   $ removeButton��6-   -   5        $��Удалить��5%   C   $��Right=�6U   $	��100��6l   $��Right=�6x   6�   5&   #   5'      5(      5)      5+      5,      �� 5-   
   $<��6Выберите пункт выдачи заказа:��6   $��0, 10, 0, 0q�69   �� 5.   
   -   5        $"��pickupPointSelectionComboBox��5.      $��0, 0, 0, 10q�67    �� DisplayMemberPath$ Address��6L   � 5/   
   .+�50      �� $��Номер заказа: ��6   $��0,3,3,0q�6.   �� 51      -   5         ��Name$ orderNumberTextBlock��51      52      � 53   
   .+�54      �� $!��Код получения: ��6   $��0,3,3,0q�6/   �� 55      -   5        $��receiptCodeTextBlock��55      $��16(�64   $
��Bold"�6B   56      � 57   
   .+�58      �� $��Сумма заказа: ��6   $��0,3,3,0q�6.   �� 59      -   5        $��priceTextBlock��59      5:      ]� 5;   
   .+�5<      �� -	   5        $��orderButton��5<      $��Заказать��6(   $��10, 10q�6;   $	��100��6K   $��Right=�6r   �� 5=      -
   5        $��saveTicketButton��5=      $6��0Сохранить талон получения��6-   $	��200��6Q   $��10,10q�6]   $
��Left=�6l   6�   5>      5?      5@      