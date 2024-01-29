import 'package:mongo_dart/mongo_dart.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:video_player/video_player.dart';

final String mongodbUri =
    "mongodb+srv://mazlum:qqwwqqww11@cluster0.4molq.mongodb.net/psynexa?retryWrites=true&w=majority";
final String collectionName = "videos";

Future<void> uploadVideoToMongoDB(VideoPlayerController videoPath) async {
  try {
    // MongoDB bağlantısını kur
    var db = await Db.create(mongodbUri);
    await db.open();

    // Koleksiyonu al veya oluştur
    var collection = db.collection(collectionName);

    // Video belgesini oluştur
    var videoDocument = {
      'path': videoPath,
      'uploadTime': DateTime.now(),
    };

    // Videoyu MongoDB'ye ekle
    await collection.save(videoDocument);

    // Bağlantıyı kapat
    await db.close();
  } catch (e) {
    print("Error uploading video to MongoDB: $e");
  }
}
