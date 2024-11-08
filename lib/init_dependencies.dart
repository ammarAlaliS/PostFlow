import 'package:get/get.dart';
import 'package:post_flow/controllers/comment_controller.dart';
import 'package:post_flow/controllers/get_user_controller.dart';
import 'package:post_flow/controllers/save_post_controller.dart';
import 'package:post_flow/data/data_sources/commet_data_sources.dart';
import 'package:post_flow/data/data_sources/user_data_sources.dart';
import 'package:post_flow/data/repositories/commet_repository_impl.dart';
import 'package:post_flow/data/repositories/post_repository.dart';
import 'package:post_flow/data/repositories/user_repository_impl.dart';
import 'package:post_flow/domain/repositories/comment_repository_interface.dart';
import 'package:post_flow/domain/repositories/user_repository.dart';
import 'package:post_flow/domain/usecases/get_post_commet.dart';
import 'package:post_flow/domain/usecases/get_posts.dart';
import 'package:post_flow/data/data_sources/post_data_source.dart';
import 'package:post_flow/domain/usecases/get_user.dart';

void init() {

  Get.put(PostRepositoryImpl(remoteDataSource: PostRemoteDataSourceImpl())); 
  
  Get.put(GetPosts(repository: Get.find<PostRepositoryImpl>()));
  
  Get.put<CommentRemoteDataSource>(CommentRemoteDataSourceImpl());

  final commentRepository = CommentRepositoryImpl(remoteDataSource: Get.find<CommentRemoteDataSource>());
  Get.put<CommentRepositoryInterface>(commentRepository);

  final getPostCommentUseCase = GetPostCommentUseCase(commentRepositoryInterface: Get.find<CommentRepositoryInterface>());
  Get.put<GetPostCommentUseCase>(getPostCommentUseCase); 

  Get.put<CommentController>(CommentController(getPostCommentUseCase: Get.find<GetPostCommentUseCase>()));

  Get.put<UserRemoteDataSource>(UserRemoteDataSource(baseUrl: 'https://jsonplaceholder.typicode.com'));

  Get.put<UserRepositoryInterface>(UserRepositoryImpl(userRemoteDataSource: Get.find()));

  Get.put<GetUserUseCase>(GetUserUseCase(userRepositoryInterface: Get.find()));

  Get.put<UserController>(UserController(getUserUseCase: Get.find()));
  
  Get.put<SavedPostsController>(SavedPostsController());


}
