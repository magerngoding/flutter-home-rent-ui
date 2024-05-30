class Home {
  final String name;
  final String imageRaw;
  final String imageCover;
  final String address;
  final String city;
  final int bedroom;
  final int bathroom;
  final String description;
  final String profile;
  final String owner;
  final List<String> gallery;
  final double price;

  Home({
    required this.name,
    required this.imageRaw,
    required this.imageCover,
    required this.address,
    required this.city,
    required this.bedroom,
    required this.bathroom,
    required this.description,
    required this.profile,
    required this.owner,
    required this.gallery,
    required this.price,
  });
}

final listNearHome = [
  Home(
    name: 'Dreamsville House',
    imageRaw: 'assets/raw1.png',
    imageCover: 'assets/cover1.png',
    address: 'Jl. Sultan Iskandar Muda',
    city: 'Jakarta Selatan',
    bedroom: 6,
    bathroom: 4,
    description:
        'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars and 5 motorbike with other bycycle.',
    profile: 'assets/profile.png',
    owner: 'Garry Allen',
    gallery: [
      'assets/gallery1.png',
      'assets/gallery2.png',
      'assets/gallery3.png',
      'assets/gallery4.png'
    ],
    price: 2500000000,
  ),
  Home(
    name: 'Ascot House',
    imageRaw: 'assets/raw2.png',
    imageCover: 'assets/cover2.png',
    address: 'Jl. Cilandak Tengah',
    city: 'Jakarta Selatan',
    bedroom: 6,
    bathroom: 4,
    description:
        'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars and 5 motorbike with other bycycle.',
    profile: 'assets/profile.png',
    owner: 'Garry Allen',
    gallery: [
      'assets/gallery1.png',
      'assets/gallery2.png',
      'assets/gallery3.png',
      'assets/gallery4.png'
    ],
    price: 2500000000,
  ),
];

final listBestHome = [
  Home(
    name: 'Orchad House',
    imageRaw: 'assets/raw3.png',
    imageCover: 'assets/cover3.png',
    address: 'Jl. Sultan Iskandar Muda',
    city: 'Jakarta Selatan',
    bedroom: 6,
    bathroom: 4,
    description:
        'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars and 5 motorbike with other bycycle.',
    profile: 'assets/profile.png',
    owner: 'Garry Allen',
    gallery: [
      'assets/gallery1.png',
      'assets/gallery2.png',
      'assets/gallery3.png',
      'assets/gallery4.png'
    ],
    price: 2500000000,
  ),
  Home(
    name: 'The Hollies House',
    imageRaw: 'assets/raw4.png',
    imageCover: 'assets/cover4.png',
    address: 'Jl. Cilandak Tengah',
    city: 'Jakarta Selatan',
    bedroom: 5,
    bathroom: 2,
    description:
        'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars and 5 motorbike with other bycycle.',
    profile: 'assets/profile.png',
    owner: 'Garry Allen',
    gallery: [
      'assets/gallery1.png',
      'assets/gallery2.png',
      'assets/gallery3.png',
      'assets/gallery4.png'
    ],
    price: 2000000000,
  ),
  Home(
    name: 'Sea Breezes House',
    imageRaw: 'assets/raw5.png',
    imageCover: 'assets/cover5.png',
    address: 'Jl. Cilandak Tengah',
    city: 'Jakarta Selatan',
    bedroom: 6,
    bathroom: 4,
    description:
        'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars and 5 motorbike with other bycycle.',
    profile: 'assets/profile.png',
    owner: 'Garry Allen',
    gallery: [
      'assets/gallery1.png',
      'assets/gallery2.png',
      'assets/gallery3.png',
      'assets/gallery4.png'
    ],
    price: 2500000000,
  ),
];
