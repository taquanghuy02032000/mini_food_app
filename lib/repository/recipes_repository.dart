import 'package:mini_food_app/api/http_di.dart';
import 'package:mini_food_app/data/constant.dart';
import 'package:mini_food_app/repository/model/recipes_model.dart';

abstract class RecipeRepository {
  Future<List<RecipeModel>?> getRecipes({
    String? query,
    bool? instructionsRequired,
  });
}

class RecipeRepositoryImplement implements RecipeRepository {
  final FFApiClientExtension clientExtension;

  RecipeRepositoryImplement(this.clientExtension);

  @override
  Future<List<RecipeModel>?> getRecipes({
    String? query,
    bool? instructionsRequired,
  }) async {
    Map<String, dynamic> paramConvert = {};

    paramConvert = {
      'query': query,
      'instructionsRequired': instructionsRequired,
    };

    try {
      final responseOrigin = await clientExtension.get(
        FFEndPoint.GET_RECIPES,
        paramConvert,
      );
      if (responseOrigin.data != null) {
        final RecipesTotalResponse recipesTotalResponse = RecipesTotalResponse.fromJson(responseOrigin.data!);
        if (recipesTotalResponse.totalResults != 0) {
          return recipesTotalResponse.results ?? [];
        } else {
          return [];
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
