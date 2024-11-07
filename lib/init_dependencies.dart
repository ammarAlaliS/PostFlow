import 'package:get/get.dart';
import 'package:post_flow/controllers/comment_controller.dart';
import 'package:post_flow/data/data_sources/commet_data_sources.dart';
import 'package:post_flow/data/repositories/commet_repository_impl.dart';
import 'package:post_flow/data/repositories/post_repository.dart';
import 'package:post_flow/domain/repositories/comment_repository_interface.dart';
import 'package:post_flow/domain/usecases/get_post_commet.dart';
import 'package:post_flow/domain/usecases/get_posts.dart';
import 'package:post_flow/data/data_sources/post_data_source.dart';

void init() {
  // Registra el PostRepositoryImpl con su respectivo RemoteDataSource
  Get.put(PostRepositoryImpl(remoteDataSource: PostRemoteDataSourceImpl())); 
  
  // Registra el GetPosts que depende de PostRepositoryImpl
  Get.put(GetPosts(repository: Get.find<PostRepositoryImpl>()));
  
   // Registrar el CommentRemoteDataSource
  Get.put<CommentRemoteDataSource>(CommentRemoteDataSourceImpl());

  // Registrar el CommentRepositoryImpl con el CommentRemoteDataSource
  final commentRepository = CommentRepositoryImpl(remoteDataSource: Get.find<CommentRemoteDataSource>());
  Get.put<CommentRepositoryInterface>(commentRepository);

  // Registrar el GetPostCommentUseCase que depende de CommentRepositoryInterface
  final getPostCommentUseCase = GetPostCommentUseCase(commentRepositoryInterface: Get.find<CommentRepositoryInterface>());
  Get.put<GetPostCommentUseCase>(getPostCommentUseCase);  // Inyectamos el caso de uso

  // Ahora puedes inyectar el CommentController, que depende del caso de uso
  Get.put<CommentController>(CommentController(getPostCommentUseCase: Get.find<GetPostCommentUseCase>()));


}
