class Product {
  Product({
    required this.img,
    required this.title,
    required this.location,
    required this.description,
    required this.price,
  });
  final List<String> img;
  final String title;
  final String location;
  final String description;
  final double price;
}

List<Product> productsList = [
  Product(
    img: [
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Example image URL
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    title: 'Mountain Bike',
    location: 'Pokhara, Nepal',
    description:
        'A rugged mountain bike perfect for exploring the trails around Phewa Lake and Sarangkot.',
    price: 50.00,
  ),
  Product(
    img: [
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Example image URL
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    title: 'Luxury Yacht',
    location: 'Rara Lake, Mugu, Nepal',
    description:
        'A luxurious yacht experience on the pristine waters of Rara Lake, the largest lake in Nepal.',
    price: 3000.00,
  ),
  Product(
    img: [
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Example image URL
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    title: 'Sports Car',
    location: 'Kathmandu, Nepal',
    description:
        'A high-performance sports car available for rent to cruise through the streets of Kathmandu.',
    price: 500.00,
  ),
  Product(
    img: [
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Example image URL
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    title: 'Private Jet',
    location: 'Tribhuvan International Airport, Kathmandu, Nepal',
    description:
        'A luxurious private jet available for rent, perfect for business or personal travel across Nepal and beyond.',
    price: 10000.00,
  ),
];
