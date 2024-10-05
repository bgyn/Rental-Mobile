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
      'https://images.unsplash.com/photo-1453901593090-e57bfb58f39b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fERpcnQlMjBiaWtlfGVufDB8fDB8fHww', // Example image URL
      'https://plus.unsplash.com/premium_photo-1661935844586-db21256a120d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fERpcnQlMjBiaWtlfGVufDB8fDB8fHww',
    ],
    title: 'Mountain Bike',
    location: 'Pokhara, Nepal',
    description:
        'A rugged mountain bike perfect for exploring the trails around Phewa Lake and Sarangkot.',
    price: 50.00,
  ),
  Product(
    img: [
      'https://images.unsplash.com/photo-1569263979104-865ab7cd8d13?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fEx1eHVyeSUyMFlhdGNofGVufDB8fDB8fHww', // Example image URL
      'https://plus.unsplash.com/premium_photo-1680831748191-d726a2f7b201?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8THV4dXJ5JTIwWWF0Y2h8ZW58MHx8MHx8fDA%3D',
    ],
    title: 'Luxury Yacht',
    location: 'Rara Lake, Mugu, Nepal',
    description:
        'A luxurious yacht experience on the pristine waters of Rara Lake, the largest lake in Nepal.',
    price: 3000.00,
  ),
  Product(
    img: [
      'https://images.unsplash.com/photo-1508974239320-0a029497e820?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhcnxlbnwwfHwwfHx8MA%3D%3D', // Example image URL
      'https://plus.unsplash.com/premium_photo-1664304752635-3e0d8d8185e3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNhcnxlbnwwfHwwfHx8MA%3D%3D',
    ],
    title: 'Sports Car',
    location: 'Kathmandu, Nepal',
    description:
        'A high-performance sports car available for rent to cruise through the streets of Kathmandu.',
    price: 500.00,
  ),
  Product(
    img: [
      'https://plus.unsplash.com/premium_photo-1674343001705-40a1a7b80e44?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8amV0fGVufDB8fDB8fHww', // Example image URL
      'https://images.unsplash.com/photo-1535329974905-5de1dd801423?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGpldHxlbnwwfHwwfHx8MA%3D%3D',
    ],
    title: 'Private Jet',
    location: 'Tribhuvan International Airport, Kathmandu, Nepal',
    description:
        'A luxurious private jet available for rent, perfect for business or personal travel across Nepal and beyond.',
    price: 10000.00,
  ),
];
