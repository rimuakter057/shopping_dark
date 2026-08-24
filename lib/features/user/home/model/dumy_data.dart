final List<Map<String, dynamic>> dummyHomeData = [
  {
    "id": "p1",
    "name": "ZEGIFY",
    "categories": [
      {
        "id": "c1",
        "name": "Shoes",
        "brands": [
          {"id": "b1", "name": "Nike"},
          {"id": "b2", "name": "Adidas"},
        ]
      },
      {
        "id": "c2",
        "name": "Watch",
        "brands": [
          {"id": "b3", "name": "Rolex"},
          {"id": "b4", "name": "Casio"},
        ]
      }
    ]
  },
  {
    "id": "p2",
    "name": "ZETRO TECH",
    "categories": [
      {
        "id": "c3",
        "name": "Mobile",
        "brands": [
          {"id": "b5", "name": "Samsung"},
          {"id": "b6", "name": "Apple"},
        ]
      }
    ]
  }
];

final List<Map<String, dynamic>> dummyProducts = [
  {
    "id": "pr1",
    "name": "Nike Air Max",
    "type": "exclusive",
    "parentId": "p1",
    "categoryId": "c1",
    "brandId": "b1",
  },
  {
    "id": "pr2",
    "name": "Adidas Runner",
    "type": "feature",
    "parentId": "p1",
    "categoryId": "c1",
    "brandId": "b2",
  },
  {
    "id": "pr3",
    "name": "iPhone 15",
    "type": "exclusive",
    "parentId": "p2",
    "categoryId": "c3",
    "brandId": "b6",
  },
];