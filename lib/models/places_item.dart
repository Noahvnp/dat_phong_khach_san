class PlaceItem {
  final String name;
  final String imageUrl;

  PlaceItem({
    required this.name,
    required this.imageUrl,
  });

  PlaceItem copyWith({
    String? name,
    String? imageUrl,
  }) {
    return PlaceItem(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

List<PlaceItem> places = [
  PlaceItem(
    name: 'Cần Thơ',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Can-tho-tuonglamphotos.jpg/640px-Can-tho-tuonglamphotos.jpg',
  ),
  PlaceItem(
    name: 'Vũng Tàu',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Vung_Tau%2C_Viet_Nam_2021.jpg/640px-Vung_Tau%2C_Viet_Nam_2021.jpg',
  ),
  PlaceItem(
    name: 'Nha Trang',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Nha_Trang_Beach_7.jpg/640px-Nha_Trang_Beach_7.jpg',
  ),
  PlaceItem(
    name: 'Hồ Chí Minh',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/B%C6%B0u_%C4%90i%E1%BB%87n%2C_S%C3%A0i_G%C3%B2n_%2840632452613%29.jpg/640px-B%C6%B0u_%C4%90i%E1%BB%87n%2C_S%C3%A0i_G%C3%B2n_%2840632452613%29.jpg',
  ),
  PlaceItem(
    name: 'Đà Lạt',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/L%C3%A2m_Vi%C3%AAn_%C4%90%C3%A0_L%E1%BA%A1t.JPG/640px-L%C3%A2m_Vi%C3%AAn_%C4%90%C3%A0_L%E1%BA%A1t.JPG',
  ),
];
