import 'package:flutter/foundation.dart';

import '../../models/cook.dart';

class CookManager with ChangeNotifier {
  final List<Cook> _items = [
    Cook(
      id: 'p1',
      title: 'Canh chua cá lóc',
      description: '- Phi thơm 1 thìa hành tỏi băm nhuyễn với dầu ăn, cho thêm ½ thìa ớt bột để tạo màu.\n- Cho cá vào đảo nhẹ rồi cho nước vào nấu canh, cho thêm nước me chua và thơm vào, bạn có thể hầm nước xương riêng để canh thêm ngọt nhé.\n- Đến khi nước sôi, bạn dùng thìa lớn vớt hết bọt phía trên để nước canh được trong.\n- Nước sôi khoảng 3 phút, cá sắp chín tới, bạn cho cà chua, đậu bắp, dọc mùng, giá đậu vào.\n- Nêm thêm ¼ thìa muối, ½ thìa đường, 1 thìa hạt nêm, ½ thìa bột ngọt sao cho vừa ăn nhé.\n- Khi thấy món canh đã chín tới, bạn tắt bếp, cho rau thơm và hạt tiêu vào là đã hoàn thành món canh chua cá lóc.',
      img:
          'https://bepyeu.com/wp-content/uploads/2020/07/cach-nau-canh-chua-ca-loc-hap-dan-trong-nhung-ngay-he-1.jpg',
      isFavorite: true,
    ),
    Cook(
      id: 'p2',
      title: 'Thịt kho hột vịt',
      description: '- Canh đường: Chuẩn bị một chiếc nồi đáy dày, cho đường vào đun với lửa vừa, dùng đũa khuấy đều cho đến khi đường chuyển sang màu nâu.\n- Sau đó cho ít nước trắng vào đun sôi lên.\n- Nếu chưa biết làm bạn có thể dùng lọ nước màu bán ở các tiệm tạp hóa.\n- Cho nước canh đường ra bát, sau đó cho hành tỏi băm vào nồi vừa rồi để xào thơm khoảng 1 phút.\n- Cho thịt vào xào. Thịt lợn khi xào sẽ tiết ra một ít nước, bạn xào cho đến khi thịt săn lại, khoảng 7 đến 10 phút thì tắt bếp.\n- Chuẩn bị hỗn hợp tẩm ướp theo công thức sau: 2 thìa hành khô băm + 1 thìa hạt tiêu + 1 thìa hạt nêm + 1 muỗng canh nước mắm + 1 thìa nước tương + 1 muỗng canh đường. Tất cả cho vào thịt lợn vừa xào rồi đảo đều lên cho tất cả thịt đều được ngấm vị. Ướp trong khoảng 30 phút.\n- Sau đó dưới 200 ml nước cốt dừa lên trên, cho nước lọc vào ngập thịt rồi kho 10 phút với lửa vừa.\n- Cho trứng vịt vào đảo qua một chút để trứng cũng được ngấm màu và vị, đun sôi rồi vặn nút hầm.\n- Kho đến khi màu sắc của thịt và trứng vịt đồng đều, nếm thử thịt thấy mềm mềm là được. Chỉnh lại gia vị cho phù hợp với khẩu vị của gia đình.\n- Cho thêm hành lá vào cho đẹp mắt. Nếu gia đình bạn thích ăn cay thì có thể cho thêm ớt tươi vào, cắt lát hoặc để cả quả cũng được, đều không làm giảm đi độ ngon của món ăn này.',
      img:
          'https://media.cooky.vn/recipe/g1/7207/s800x500/recipe7207-635725793750496575.jpg',
    ),
    Cook(
      id: 'p3',
      title: 'Cá lóc nướng chui',
      description: 'Cá lóc làm sạch, dùng chanh hoặc rượu trắng để rửa cho cá sạch hết nhớt. Sau đó, cho 1 thìa nhỏ muối, 1 thìa đường, 1 thìa tiêu và 2 thìa nước mắm vào cá ướp khoảng 30 phút cho cá ngấm đều gia vị.\n– Pha nước mắm tỏi ớt: Cho 1 thìa ớt và tỏi giã nhuyễn, 2 thìa súp giấm, 3 thìa canh đường, 5 thìa súp nước mắm nguyên chất, 2 muôi canh nước lọc vào tô rồi khuấy đều cho đến khi đường tan hết là được.\n–  Rau sống, xà lách và giá đỗ nhặt rồi rủa sạch và để ráo nước.\n– Dưa leo, khế, chuối xanh và thơm rửa sạch, gọt bỏ vỏ rồi cắt thành miếng vừa ăn.\n– Hành lá rửa sạch, thái thật nhỏ rồi cho vào xào thơm với 1 muôi dầu ăn.\n– Cá sau khi ướp xong để vào trong khay nướng rưới đều nước ướp lên mình cá rồi cho cá vào lò nướng nướng khoảng 15 phút ở nhiệt độ 180 độ C rồi lấy cá ra dở lại mặt cá và cho vào nướng tiếp khoảng 15 phút nữa là cá chín.\n– Khi cá chín thì rưới nước hành mỡ đã xào, 1 chút tiêu vào là được.\n– Cuối cùng bạn chỉ cần dọn cá ra đĩa, trang trí cho đẹp mắt',
      img:
          'https://th.bing.com/th/id/R.e9d0db55a4ca327ede6f3366ff747d28?rik=m3wRQ3mj435uAQ&pid=ImgRaw&r=0&sres=1&sresct=1',
    ),
    Cook(
      id: 'p4',
      title: 'Chuột quay lu',
      description: '- Để chế biến món chuột quay lu phải chọn những chú béo múp tốt nhất là nên chọn chuột cống nhum. Làm sạch ruột, cắt móng, rồi tẩm ướp gia vị trong khoảng 15 phút, sau đó móc từng con cho vào lu, vừa quay vừa trở tay. Trong lúc quay, liên tục thêm mỡ, thêm nước gia vị, khoảng một tiếng thì chuột chín. Mở nắp lu, những chú chuột đồng chín vàng, mùi thơm hấp dẫn.\n- Bày chuột ra đĩa, dùng kèm với muối tiêu chanh, rau răm, chuối chát, cà chua, dưa leo. Kế đến là bưng ra mâm mời mọi người cùng thưởng thức một món đặc sản miền Tây. Món chuột quay lu rất công phu nên chỉ làm ở trong các bữa tiệc miền Tây tại các gia đình có lễ tiệc tự tay làm  hoặc một số nhà hàng, quán ăn đặc sản mới làm món này cho mọi người thưởng thức.',
      img:
          'https://th.bing.com/th/id/R.d2d75adaf31fbc462d705d91785ee5a4?rik=Hx%2boVNwicukaig&pid=ImgRaw&r=0',
      isFavorite: true,
    ),
  ];

  int get itemCount {
    return _items.length;
  }

  List<Cook> get items {
    return [..._items];
  }

  List<Cook> get favoriteItems{
    return _items.where((cookItem) => cookItem.isFavorite).toList();
  }

  void addCook(Cook cook) {
    _items.add(
      cook.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
      );
      notifyListeners();
  }

  void updatedCook(Cook cook) {
    final index = _items.indexWhere((item) => item.id == cook.id);
    if(index >= 0) {
      _items[index] = cook;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(Cook cook) {
    final saveStatus = cook.isFavorite;
    cook.isFavorite = !saveStatus;
  }

  Cook findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}