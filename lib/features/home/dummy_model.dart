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
    title: 'Luxury Villa',
    location: 'Bali, Indonesia',
    description:
        'A beautiful luxury villa with ocean views and private beach access.',
    price: 1500.00,
  ),
  Product(
    img: [
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Example image URL
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    title: 'Mountain Cabin',
    location: 'Aspen, Colorado',
    description:
        'A cozy cabin nestled in the mountains, perfect for a winter retreat.',
    price: 1200.00,
  ),
  Product(
    img: [
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Example image URL
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    title: 'Urban Apartment',
    location: 'New York, USA',
    description:
        'A modern apartment in the heart of the city with skyline views.',
    price: 2500.00,
  ),
  Product(
    img: [
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Example image URL
      'https://images.unsplash.com/photo-1721367632166-0d851a5349af?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    title: 'Beach House',
    location: 'Malibu, California',
    description:
        'A charming beach house right on the sand, ideal for a relaxing vacation.',
    price: 2000.00,
  ),
];
