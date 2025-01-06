import 'package:flutter/material.dart';
import 'package:rsc_motorshop/src/model/product.dart';
import 'package:rsc_motorshop/src/model/numerical.dart';
import 'package:rsc_motorshop/src/model/categorical.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rsc_motorshop/src/model/product_category.dart';
import 'package:rsc_motorshop/src/model/product_size_type.dart';
import 'package:rsc_motorshop/src/model/recommended_product.dart';
import 'package:rsc_motorshop/src/model/bottom_navy_bar_item.dart';

class AppData {
  const AppData._();
  static List<Product> mostBuyItems = [
     Product(
      name: 'Yamaha Nmax',
      price: 151000,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/yamahaNmaxDark.webp',
        'assets/images/yamahaNmaxGrey.webp',
        'assets/images/yamahaNmaxSilver.webp',
      ],
      isFavorite: true,
      rating: 4,
      type: ProductType.yamahamotors,
      about: 'The Yamaha Nmax offers superb handling and a comfortable ride, perfect for everyday commutes with a 155cc engine.'
    ),
        Product(
      name: 'ScrawHelmetBR',
      price: 3500,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/ScrawHelmetBR.jpg',
        'assets/images/ScrawHelmetBW.jpg',
        'assets/images/ScrawHelmetBY.jpg',
      ],
      isFavorite: false,
      rating: 3,
      type: ProductType.helmets,
      about: 'The Scraw helmet offers both safety and comfort, perfect for motorcycle enthusiasts who enjoy long rides.'
    ),
    Product(
      name: 'Yamaha Aerox 155',
      price: 145000,
      isAvailable: true,
      off: 124000,
      quantity: 0,
      images: [
        'assets/images/yamahaAeroxBlack.webp',
        'assets/images/yamahaAeroxBlue.webp',
        'assets/images/yamahaAeroxWhite.webp',
      ],
      isFavorite: true,
      rating: 4,
      type: ProductType.yamahamotors,
      about: 'A sleek, stylish, and powerful scooter, ideal for city riding with a 155cc engine for great performance.'
    ),
       Product(
      name: 'Honda Civic',
      price: 1500000,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/hondacivicMetallic.webp',
        'assets/images/hondacivicRed.webp',
        'assets/images/hondacivicWhite.webp',
      ],
      isFavorite: false,
      rating: 5,
      type: ProductType.hondaCars,
      about: 'A luxury sedan with an advanced 1.5L turbo engine, offering a blend of performance, comfort, and technology.'
    ),
        Product(
      name: 'Rizoma Stealth Mirrors',
      price: 8500,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/rizoma_stealth_mirrors_red.jpg',
        'assets/images/rizoma_stealth_mirrors_violet.jpg',
        'assets/images/rizoma_stealth_mirrors_green.jpg',
      ],
      isFavorite: false,
      rating: 2,
      type: ProductType.motorparts,
      about: 'Stylish and durable motorcycle mirrors, designed to enhance your bike’s appearance with a sleek and modern look.'
    ),
  ];




  static const String modifiedDummyText = '1';
  static List<Product> products = [
     
    Product(
      name: 'Yamaha Nmax',
      price: 151000,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/yamahaNmaxDark.webp',
        'assets/images/yamahaNmaxGrey.webp',
        'assets/images/yamahaNmaxSilver.webp',
      ],
      isFavorite: true,
      rating: 4,
      type: ProductType.yamahamotors,
      about: 'The Yamaha Nmax offers superb handling and a comfortable ride, perfect for everyday commutes with a 155cc engine.'
    ),
    Product(
      name: 'Yamaha Sniper 155',
      price: 129900,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/yamahaSniperGrey.webp',
        'assets/images/yamahaSniperBlue.webp',
        'assets/images/yamahaSniperBlack.webp',
      ],
      isFavorite: false,
      rating: 3.5,
      type: ProductType.yamahamotors,
      about: 'A lightweight and aggressive scooter with a 155cc engine, designed for a sporty and thrilling riding experience.'
    ),
    Product(
      name: 'Yamaha Mio Fazzio',
      price: 95000,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/yamahaFazzioRed.webp',
        'assets/images/yamahaFazzioBlue.webp',
        'assets/images/yamahaFazzioWhite.webp',
      ],
      isFavorite: false,
      rating: 3,
      type: ProductType.yamahamotors,
      about: 'Compact and efficient, the Mio Fazzio is the ideal scooter for city commuting, offering great fuel economy and ease of use.'
    ),
    Product(
      name: 'Honda Civic',
      price: 1500000,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/hondacivicMetallic.webp',
        'assets/images/hondacivicRed.webp',
        'assets/images/hondacivicWhite.webp',
      ],
      isFavorite: false,
      rating: 5,
      type: ProductType.hondaCars,
      about: 'A luxury sedan with an advanced 1.5L turbo engine, offering a blend of performance, comfort, and technology.'
    ),
    Product(
      name: 'Honda Brio',
      price: 735000,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/hondaBrioPearl.webp',
        'assets/images/hondaBrioOrange.webp',
        'assets/images/hondaBrioLime.webp',
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.hondaCars,
      about: 'A compact and efficient car with a stylish design, offering great value and fuel economy for daily use.'
    ),
    Product(
      name: 'Honda CR-V',
      price: 2590000,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/hondaCR-VBlue.webp',
        'assets/images/hondaCR-VGray.webp',
        'assets/images/hondaCR-VWhite.webp',
      ],
      isFavorite: false,
      rating: 4.5,
      type: ProductType.hondaCars,
      about: 'A versatile SUV with a spacious interior and strong engine performance, making it perfect for family trips and adventure.'
    ),
    Product(
      name: 'Honda BR-V',
      price: 1090000,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/Honda BR-VSilver.webp',
        'assets/images/Honda BR-VWhite.webp',
        'assets/images/Honda BR-VGray.webp',
      ],
      isFavorite: false,
      rating: 2,
      type: ProductType.hondaCars,
      about: 'A compact SUV designed for urban families, offering a comfortable ride and a flexible interior layout.'
    ),
    Product(
      name: 'Rizoma Stealth Mirrors',
      price: 8500,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/rizoma_stealth_mirrors_red.jpg',
        'assets/images/rizoma_stealth_mirrors_violet.jpg',
        'assets/images/rizoma_stealth_mirrors_green.jpg',
      ],
      isFavorite: false,
      rating: 2,
      type: ProductType.motorparts,
      about: 'Stylish and durable motorcycle mirrors, designed to enhance your bike’s appearance with a sleek and modern look.'
    ),
    Product(
      name: 'New Rage Cycles LED Fender Eliminator',
      price: 900,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/LED Fender Eliminator1.jpg',
        'assets/images/LED Fender Eliminator2.jpg',
        'assets/images/LED Fender Eliminator3.jpg',
      ],
      isFavorite: false,
      rating: 2,
      type: ProductType.motorparts,
      about: 'This LED fender eliminator offers a cleaner look by removing the stock fender, providing a sleek, minimalist style for your motorcycle.'
    ),
    Product(
      name: 'FMF Factory 4.1 RCT Slip-On Exhaust',
      price: 200,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/ExhaustWturbo.jpg',
        'assets/images/ExhaustBlue.jpg',
        'assets/images/ExhaustWhite.jpg',
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.motorparts,
      about: 'High-performance slip-on exhaust for motorcycles, offering improved sound, power, and aesthetics for a more aggressive riding experience.'
    ),
    Product(
      name: 'CRG Arrow Bar End Mirror',
      price: 500,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/mirror1.jpg',
        'assets/images/mirror2.jpg',
        'assets/images/mirror3.jpg',
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.motorparts,
      about: 'The CRG Arrow bar-end mirror is a sleek, lightweight, and durable mirror that adds both style and functionality to your motorcycle.'
    ),
    Product(
      name: 'Arai Regent-X Helmet',
      price: 3000,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/Arai RegentX HelmetYellowGrey.jpg',
        'assets/images/Arai RegentX HelmetYellow.jpg',
        'assets/images/Arai RegentX HelmetYellowWhite.jpg',
      ],
      isFavorite: false,
      rating: 3,
      type: ProductType.helmets,
      about: 'The Arai Regent-X is a high-quality, comfortable, and durable helmet, providing top-notch protection for riders.'
    ),
    Product(
      name: 'Schuberth E2 Explorer Helmet',
      price: 5000,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/Explorer HelmetGBG.jpg',
        'assets/images/Explorer HelmetWBR.jpg',
        'assets/images/Explorer HelmetYBO.jpg',
      ],
      isFavorite: false,
      rating: 4.5,
      type: ProductType.helmets,
      about: 'Designed for off-road and adventure riders, the Schuberth E2 helmet offers superior comfort, ventilation, and safety.'
    ),
    Product(
      name: 'ScrawHelmetBR',
      price: 3500,
      isAvailable: true,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/ScrawHelmetBR.jpg',
        'assets/images/ScrawHelmetBW.jpg',
        'assets/images/ScrawHelmetBY.jpg',
      ],
      isFavorite: false,
      rating: 3,
      type: ProductType.helmets,
      about: 'The Scraw helmet offers both safety and comfort, perfect for motorcycle enthusiasts who enjoy long rides.'
    ),
Product(
  name: 'Honda Wave 110 Alpha',
  price: 54000,
  isAvailable: true,
  off: 0,
  quantity: 0,
  images: [
    'assets/images/hondaWave110Red.png',
    'assets/images/hondaWave110Black.webp',
    'assets/images/hondaWave110Blue.png',
  ],
  isFavorite: false,
  rating: 3,
  type: ProductType.yamahamotors,
  about: 'A practical and reliable motorcycle, perfect for daily commutes with great fuel economy.'
),
Product(
  name: 'Universal Phone Holder',
  price: 799,
  isAvailable: true,
  off: 0,  // 10% discount
  quantity: 0,
  images: [
    'assets/images/base1.jpg',
    'assets/images/base2.jpg',
    'assets/images/base3.jpg',
  ],
  isFavorite: false,
  rating: 4,
  type: ProductType.accessories,
  about: 'This universal phone holder is designed for all smartphones. It features a sturdy clamp that ensures your phone stays securely in place during drives or other activities.'
),
Product(
  name: 'Pipe Blue',
  price: 2499,
  isAvailable: true,
  off: 0,  // 5% discount
  quantity: 0,
  images: [
    'assets/images/ExhaustBlue.jpg',
    'assets/images/ExhaustWhite.jpg',
    'assets/images/ExhaustWturbo.jpg',
  ],
  isFavorite: false,
  rating: 4,
  type: ProductType.motorparts,
  about: 'The Pipe Exhaust Blue is designed for motorcycles, offering enhanced performance and a sleek, stylish blue finish. It provides an aggressive sound while improving engine efficiency.'
),
Product(
  name: 'Handguards',
  price: 1499,
  isAvailable: true,
  off: 0,  // 10% discount
  quantity: 0,
  images: [
    'assets/images/HandguardsB.jpg',
    'assets/images/HandguardsR.jpg',
    'assets/images/HandguardsW.jpg',
  ],
  isFavorite: false,
  rating: 4,
  type: ProductType.accessories,
  about: 'Handguards are designed to protect your hands from debris, branches, and other hazards while riding. These durable handguards are a perfect addition for off-road and adventure motorcycle riders.'
),
/////////////////////
Product(
  name: 'Kawasaki Ninja 400',
  price: 250000,
  isAvailable: true,
  off: null,
  quantity: 0,
  images: [
    'assets/images/kawasakiNinja400Green.png',
    'assets/images/kawasakiNinja400Black.png',
    'assets/images/kawasakiNinja400Red.png'

  ],
  isFavorite: false,
  rating: 4.5,
  type: ProductType.yamahamotors,
  about: 'A versatile sportbike offering excellent performance and handling with a 399cc engine, perfect for both beginners and experienced riders.'
),

Product(
  name: 'Suzuki V-Strom 650',
  price: 800000,
  isAvailable: true,
  off: null,
  quantity: 0,
  images: [
            'assets/images/fordF150Black.png'
,
    'assets/images/fordF150Red.png',
    'assets/images/fordF150Blue.png',
  ],
  isFavorite: false,
  rating: 4.3,
  type: ProductType.yamahamotors,
  about: 'A mid-sized adventure motorcycle designed for both off-road and on-road riding, with a comfortable ride and reliable performance.'
),

Product(
  name: 'Ford F-150',
  price: 2500000,
  isAvailable: true,
  off: null,  // No discount currently applied
  quantity: 0,
  images: [
        'assets/images/fordF1502.png',
    'assets/images/fordF1501.png',
    'assets/images/fordF1503.png'

  ],
  isFavorite: false,
  rating: 4.8,
  type: ProductType.hondaCars,  // Change type to 'trucks'
  about: 'A powerful full-size truck with superior towing capacity, advanced technology, and rugged durability, ideal for heavy-duty work.'
),

Product(
  name: 'Ram 1500',
  price: 2800000,
  isAvailable: true,
  off: null,  // No discount currently applied
  quantity: 0,
  images: [
        'assets/images/ram1500White.png',
    'assets/images/ram1500Black.png',
    'assets/images/ram1500Blue.png',
  ],
  isFavorite: false,
  rating: 4.7,
  type: ProductType.hondaCars,  // Change type to 'trucks'
  about: 'A versatile truck with outstanding performance, luxurious interior, and innovative features, built for both work and leisure.'
),

Product(
  name: 'Chevrolet Silverado 1500',
  price: 2700000,
  isAvailable: true,
  off: null,  // No discount currently applied
  quantity: 0,
  images: [
    'assets/images/chevroletSilveradoBlack.png',
    'assets/images/chevroletSilveradoSilver.png',
    'assets/images/chevroletSilveradoRed.png'

  ],
  isFavorite: false,
  rating: 4.6,
  type: ProductType.hondaCars,  // Change type to 'trucks'
  about: 'A robust truck with modern technology and a spacious cabin, offering impressive towing capacity and off-road capabilities.'
),


// Product(
//   name: 'Motul 300V 4T Engine Oil',
//   price: 1500,
//   isAvailable: true,
//   off: null,
//   quantity: 0,
//   images: [
//     'assets/images/motul300VEngineOil.jpg'
//   ],
//   isFavorite: false,
//   rating: 4.8,
//   type: ProductType.accessories,
//   about: 'A high-performance synthetic engine oil designed to enhance the engine'
// )

  ];
static List<ProductCategory> categories = [
  ProductCategory(
    type: ProductType.all,
    icon: Icons.category,  // General category icon
  ),
  ProductCategory(
    type: ProductType.yamahamotors,
    icon: FontAwesomeIcons.motorcycle,  // FontAwesome motorcycle icon for Yamaha motors
  ),
  ProductCategory(
    type: ProductType.hondaCars,
    icon: FontAwesomeIcons.car,  // FontAwesome car icon for Honda cars
  ),
  ProductCategory(
    type: ProductType.motorparts,
    icon: FontAwesomeIcons.cogs,  // FontAwesome cog icon for motor parts
  ),
  ProductCategory(
    type: ProductType.helmets,
    icon: FontAwesomeIcons.helmetSafety,  // FontAwesome helmet icon for helmets
  ),
  
  // ProductCategory(
  //   type: ProductType.accessories,
  //   icon: Icons.accessibility_new,  // Icon for accessories (more general and unique)
  // ),
  
];

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static List<BottomNavyBarItem> bottomNavyBarItems = [
    const BottomNavyBarItem(
      "Home",
      Icon(Icons.home),
      Color(0xFFEC6813),
    ),
    const BottomNavyBarItem(
      "Favorite",
      Icon(Icons.favorite),
      Color(0xFFEC6813),
    ),
    const BottomNavyBarItem(
      "Canvas",
      Icon(Icons.money),
      Color(0xFFEC6813),
    ),
    const BottomNavyBarItem(
      "Support",
      Icon(Icons.chat_bubble),
      Color(0xFFEC6813),
    ),
  ];

static List<RecommendedProduct> recommendedProducts = [
  RecommendedProduct(
    imagePath: "assets/images/yamahaAeroxBlack.webp", // Image for Yamaha Motors
    cardBackgroundColor: const Color(0xFFEC6813),
    buttonBackgroundColor: const Color(0xFF3081E1), // Button color
    buttonTextColor: Colors.white, // Text color for the button
    productName: "Yamaha Aerox 155", // Product name from Yamaha Motors
    productPrice: "145,000", // Product price
  ),
  RecommendedProduct(
    imagePath: "assets/images/hondaCivicMetallic.webp", // Image for Honda Cars
    cardBackgroundColor: const Color(0xFF3081E1),
    buttonBackgroundColor: const Color(0xFF9C46FF),
    buttonTextColor: Colors.white,
    productName: "Honda Civic", // Product name from Honda Cars
    productPrice: "1,500,000", // Product price
  ),

];

}