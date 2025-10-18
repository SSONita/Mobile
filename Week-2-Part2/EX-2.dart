enum DeliveryType { homeDelivery, storePickup }

class Product {
  final String id;
  final String name;
  final double price;
  int stock;
  
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
  });
  
  String getName() => name;
  double getPrice() => price;
  
  void reduceStock(int quantity) {
    if (quantity > stock) {
      throw Exception('Not enough stock for $name. Available: $stock, Requested: $quantity');
    }
    stock -= quantity;
  }
  
  @override
  String toString() => '$name - \$$price (Stock: $stock)';
}

class OrderItem {
  final Product product;
  final int quantity;
  
  OrderItem({
    required this.product,
    required this.quantity,
  });
  
  double getSubtotal() => product.price * quantity;
  Product getProduct() => product;
  
  @override
  String toString() => '${product.name} x $quantity = \$${getSubtotal()}';
}

class Customer {
  final String id;
  final String name;
  final String email;
  final String? address; // Nullable for store pickup customers
  
  Customer({
    required this.id,
    required this.name,
    required this.email,
    this.address,
  });
  
  String getName() => name;
  String getEmail() => email;
  String? getAddress() => address;
  
  @override
  String toString() => 'Customer: $name ($email)';
}

class Order {
  final String id;
  final Customer customer;
  final List<OrderItem> items;
  final DeliveryType deliveryType;
  final DateTime orderDate;
  bool _isProcessed = false;
  
  Order({
    required this.id,
    required this.customer,
    required this.deliveryType,
    List<OrderItem>? items,
    DateTime? orderDate,
  }) : items = items ?? [],
        orderDate = orderDate ?? DateTime.now() {
    if (deliveryType == DeliveryType.homeDelivery && customer.address == null) {
      throw ArgumentError('Home delivery requires a customer address');
    }
  }
  
  // Q1: Method to get total amount
  double getTotal() {
    double total = 0;
    for (var item in items) {
      total += item.getSubtotal();
    }
    return total;
  }
  
  void addItem(OrderItem item) {
    if (_isProcessed) {
      throw StateError('Cannot modify a processed order');
    }
    items.add(item);
  }
  
  void removeItem(Product product) {
    if (_isProcessed) {
      throw StateError('Cannot modify a processed order');
    }
    items.removeWhere((item) => item.product.id == product.id);
  }
  
  void process() {
    if (_isProcessed) {
      throw StateError('Order already processed');
    }

    for (var item in items) {
      if (item.quantity > item.product.stock) {
        throw Exception('Insufficient stock for ${item.product.name}');
      }
    }

    for (var item in items) {
      item.product.reduceStock(item.quantity);
    }
    
    _isProcessed = true;
    print('Order $id processed successfully!');
  }
  
  @override
  String toString() {
    final deliveryInfo = deliveryType == DeliveryType.homeDelivery 
        ? 'Home Delivery to ${customer.address}'
        : 'Store Pickup';
    
    return '''
Order #$id
Customer: ${customer.name}
Delivery: $deliveryInfo
Date: $orderDate
Items:
${items.map((item) => '  - $item').join('\n')}
Total: \$${getTotal()}
Status: ${_isProcessed ? 'Processed' : 'Pending'}
''';
  }
}

void main() {
  final laptop = Product(id: '1', name: 'Laptop', price: 999.99, stock: 10);
  final mouse = Product(id: '2', name: 'Mouse', price: 29.99, stock: 50);
  final keyboard = Product(id: '3', name: 'Keyboard', price: 79.99, stock: 25);

  final customer1 = Customer(
    id: 'C001', 
    name: 'John Doe', 
    email: 'john@email.com', 
    address: '123 Main St'
  );
  
  final customer2 = Customer(
    id: 'C002', 
    name: 'Jane Smith', 
    email: 'jane@email.com'
  );

  final order1 = Order(
    id: 'ORD001',
    customer: customer1,
    deliveryType: DeliveryType.homeDelivery,
  );
  
  order1.addItem(OrderItem(product: laptop, quantity: 1));
  order1.addItem(OrderItem(product: mouse, quantity: 2));
  
  final order2 = Order(
    id: 'ORD002',
    customer: customer2,
    deliveryType: DeliveryType.storePickup,
  );
  
  order2.addItem(OrderItem(product: keyboard, quantity: 1));
  order2.addItem(OrderItem(product: mouse, quantity: 1));
  
  // Display orders
  print('=== Online Shop Management System ===\n');
  print(order1);
  print(order2);
  
  // Process orders
  print('=== Processing Orders ===');
  order1.process();
  order2.process();
  
  // Show updated stock
  print('\n=== Updated Stock ===');
  print(laptop);
  print(mouse);
  print(keyboard);
  
  // Test error cases
  try {
    Order(
      id: 'ORD003',
      customer: customer2, // No address
      deliveryType: DeliveryType.homeDelivery, // Requires address
    );
  } catch (e) {
    print('\nError: $e'); // Home delivery requires a customer address
  }
  
  try {
    order1.addItem(OrderItem(product: laptop, quantity: 1)); // Already processed
  } catch (e) {
    print('Error: $e'); // Cannot modify a processed order
  }
}