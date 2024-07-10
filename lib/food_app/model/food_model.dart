// To parse this JSON data, do
//
//     final foodApiModel = foodApiModelFromJson(jsonString);

import 'dart:convert';

FoodApiModel foodApiModelFromJson(String str) => FoodApiModel.fromJson(json.decode(str));

String foodApiModelToJson(FoodApiModel data) => json.encode(data.toJson());

class FoodApiModel {
  List<Feed>? feed;
  List<Image>? image;
  FoodApiModelSeo? seo;

  FoodApiModel({
   this.feed,
   this.seo,
   this.image,
  });

  factory FoodApiModel.fromJson(Map<String, dynamic> json) => FoodApiModel(
    feed: List<Feed>.from(json["feed"].map((x) => Feed.fromJson(x))),
    seo: FoodApiModelSeo.fromJson(json["seo"]),
    // image: Image.fromJson(json["image"]),
    image:List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "feed": List<dynamic>.from(feed!.map((x) => x.toJson())),
    "seo": seo?.toJson(),
  };
}

class Feed {
  FeedSeo seo;
  TrackingId trackingId;
  Locale locale;
  Content content;
  FeedType type;
  List<RecipeType> recipeType;
  bool proRecipe;
  FeedDisplay display;
  bool promoted;

  Feed({
    required this.seo,
    required this.trackingId,
    required this.locale,
    required this.content,
    required this.type,
    required this.recipeType,
    required this.proRecipe,
    required this.display,
    required this.promoted,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
    seo: FeedSeo.fromJson(json["seo"]),
    trackingId: trackingIdValues.map[json["tracking-id"]]!,
    locale: localeValues.map[json["locale"]]!,
    content: Content.fromJson(json["content"]),
    type: feedTypeValues.map[json["type"]]!,
    recipeType: List<RecipeType>.from(json["recipeType"].map((x) => recipeTypeValues.map[x]!)),
    proRecipe: json["proRecipe"],
    display: FeedDisplay.fromJson(json["display"]),
    promoted: json["promoted"],
  );

  Map<String, dynamic> toJson() => {
    "seo": seo.toJson(),
    "tracking-id": trackingIdValues.reverse[trackingId],
    "locale": localeValues.reverse[locale],
    "content": content.toJson(),
    "type": feedTypeValues.reverse[type],
    "recipeType": List<dynamic>.from(recipeType.map((x) => recipeTypeValues.reverse[x])),
    "proRecipe": proRecipe,
    "display": display.toJson(),
    "promoted": promoted,
  };
}

class Content {
  Description? description;
  List<dynamic> urbSubmitters;
  Tags tags;
  dynamic preparationSteps;
  MoreContent moreContent;
  TagsAds tagsAds;
  Details details;
  MoreContent relatedContent;
  List<IngredientLine> ingredientLines;
  UnitSystem unitSystem;
  Reviews reviews;
  MoreContent relatedProducts;
  int preparationStepCount;
  Nutrition nutrition;
  Yums yums;

  Content({
    required this.description,
    required this.urbSubmitters,
    required this.tags,
    required this.preparationSteps,
    required this.moreContent,
    required this.tagsAds,
    required this.details,
    required this.relatedContent,
    required this.ingredientLines,
    required this.unitSystem,
    required this.reviews,
    required this.relatedProducts,
    required this.preparationStepCount,
    required this.nutrition,
    required this.yums,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    description: json["description"] == null ? null : Description.fromJson(json["description"]),
    urbSubmitters: List<dynamic>.from(json["urbSubmitters"].map((x) => x)),
    tags: Tags.fromJson(json["tags"]),
    preparationSteps: json["preparationSteps"],
    moreContent: MoreContent.fromJson(json["moreContent"]),
    tagsAds: TagsAds.fromJson(json["tagsAds"]),
    details: Details.fromJson(json["details"]),
    relatedContent: MoreContent.fromJson(json["relatedContent"]),
    ingredientLines: List<IngredientLine>.from(json["ingredientLines"].map((x) => IngredientLine.fromJson(x))),
    unitSystem: unitSystemValues.map[json["unitSystem"]]!,
    reviews: Reviews.fromJson(json["reviews"]),
    relatedProducts: MoreContent.fromJson(json["relatedProducts"]),
    preparationStepCount: json["preparationStepCount"],
    nutrition: Nutrition.fromJson(json["nutrition"]),
    yums: Yums.fromJson(json["yums"]),
  );

  Map<String, dynamic> toJson() => {
    "description": description?.toJson(),
    "urbSubmitters": List<dynamic>.from(urbSubmitters.map((x) => x)),
    "tags": tags.toJson(),
    "preparationSteps": preparationSteps,
    "moreContent": moreContent.toJson(),
    "tagsAds": tagsAds.toJson(),
    "details": details.toJson(),
    "relatedContent": relatedContent.toJson(),
    "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x.toJson())),
    "unitSystem": unitSystemValues.reverse[unitSystem],
    "reviews": reviews.toJson(),
    "relatedProducts": relatedProducts.toJson(),
    "preparationStepCount": preparationStepCount,
    "nutrition": nutrition.toJson(),
    "yums": yums.toJson(),
  };
}

class Description {
  String mobileSectionName;
  String text;
  dynamic shortText;

  Description({
    required this.mobileSectionName,
    required this.text,
    required this.shortText,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    mobileSectionName: json["mobileSectionName"],
    text: json["text"],
    shortText: json["shortText"],
  );

  Map<String, dynamic> toJson() => {
    "mobileSectionName": mobileSectionName,
    "text": text,
    "shortText": shortText,
  };
}

class Details {
  String directionsUrl;
  String totalTime;
  String displayName;
  List<Image> images;
  String name;
  List<String> keywords;
  dynamic brand;
  String id;
  Attribution attribution;
  String recipeId;
  int numberOfServings;
  String globalId;
  int totalTimeInSeconds;
  double rating;

  Details({
    required this.directionsUrl,
    required this.totalTime,
    required this.displayName,
    required this.images,
    required this.name,
    required this.keywords,
    required this.brand,
    required this.id,
    required this.attribution,
    required this.recipeId,
    required this.numberOfServings,
    required this.globalId,
    required this.totalTimeInSeconds,
    required this.rating,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    directionsUrl: json["directionsUrl"],
    totalTime: json["totalTime"],
    displayName: json["displayName"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    name: json["name"],
    keywords: List<String>.from(json["keywords"].map((x) => x)),
    brand: json["brand"],
    id: json["id"],
    attribution: Attribution.fromJson(json["attribution"]),
    recipeId: json["recipeId"],
    numberOfServings: json["numberOfServings"],
    globalId: json["globalId"],
    totalTimeInSeconds: json["totalTimeInSeconds"],
    rating: json["rating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "directionsUrl": directionsUrl,
    "totalTime": totalTime,
    "displayName": displayName,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "name": name,
    "keywords": List<dynamic>.from(keywords.map((x) => x)),
    "brand": brand,
    "id": id,
    "attribution": attribution.toJson(),
    "recipeId": recipeId,
    "numberOfServings": numberOfServings,
    "globalId": globalId,
    "totalTimeInSeconds": totalTimeInSeconds,
    "rating": rating,
  };
}

class Attribution {
  String html;
  String url;
  String text;
  String logo;

  Attribution({
    required this.html,
    required this.url,
    required this.text,
    required this.logo,
  });

  factory Attribution.fromJson(Map<String, dynamic> json) => Attribution(
    html: json["html"],
    url: json["url"],
    text: json["text"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "html": html,
    "url": url,
    "text": text,
    "logo": logo,
  };
}

class Image {
  String hostedLargeUrl;
  String resizableImageUrl;
  int resizableImageHeight;
  int resizableImageWidth;

  Image({
    required this.hostedLargeUrl,
    required this.resizableImageUrl,
    required this.resizableImageHeight,
    required this.resizableImageWidth,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    hostedLargeUrl: json["hostedLargeUrl"],
    resizableImageUrl: json["resizableImageUrl"],
    resizableImageHeight: json["resizableImageHeight"],
    resizableImageWidth: json["resizableImageWidth"],
  );

  Map<String, dynamic> toJson() => {
    "hostedLargeUrl": hostedLargeUrl,
    "resizableImageUrl": resizableImageUrl,
    "resizableImageHeight": resizableImageHeight,
    "resizableImageWidth": resizableImageWidth,
  };
}

class IngredientLine {
  Category category;
  Amount amount;
  NameEnum unit;
  String ingredientId;
  String categoryId;
  List<RelatedRecipeSearchTerm> relatedRecipeSearchTerm;
  String ingredient;
  String id;
  String? remainder;
  double? quantity;
  String wholeLine;

  IngredientLine({
    required this.category,
    required this.amount,
    required this.unit,
    required this.ingredientId,
    required this.categoryId,
    required this.relatedRecipeSearchTerm,
    required this.ingredient,
    required this.id,
    required this.remainder,
    required this.quantity,
    required this.wholeLine,
  });

  factory IngredientLine.fromJson(Map<String, dynamic> json) => IngredientLine(
    category: categoryValues.map[json["category"]]!,
    amount: Amount.fromJson(json["amount"]),
    unit: nameEnumValues.map[json["unit"]]!,
    ingredientId: json["ingredientId"],
    categoryId: json["categoryId"],
    relatedRecipeSearchTerm: List<RelatedRecipeSearchTerm>.from(json["relatedRecipeSearchTerm"].map((x) => RelatedRecipeSearchTerm.fromJson(x))),
    ingredient: json["ingredient"],
    id: json["id"],
    remainder: json["remainder"],
    quantity: json["quantity"]?.toDouble(),
    wholeLine: json["wholeLine"],
  );

  Map<String, dynamic> toJson() => {
    "category": categoryValues.reverse[category],
    "amount": amount.toJson(),
    "unit": nameEnumValues.reverse[unit],
    "ingredientId": ingredientId,
    "categoryId": categoryId,
    "relatedRecipeSearchTerm": List<dynamic>.from(relatedRecipeSearchTerm.map((x) => x.toJson())),
    "ingredient": ingredient,
    "id": id,
    "remainder": remainder,
    "quantity": quantity,
    "wholeLine": wholeLine,
  };
}

class Amount {
  Imperial metric;
  Imperial imperial;

  Amount({
    required this.metric,
    required this.imperial,
  });

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
    metric: Imperial.fromJson(json["metric"]),
    imperial: Imperial.fromJson(json["imperial"]),
  );

  Map<String, dynamic> toJson() => {
    "metric": metric.toJson(),
    "imperial": imperial.toJson(),
  };
}

class Imperial {
  ImperialUnit unit;
  double? quantity;

  Imperial({
    required this.unit,
    required this.quantity,
  });

  factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
    unit: ImperialUnit.fromJson(json["unit"]),
    quantity: json["quantity"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "unit": unit.toJson(),
    "quantity": quantity,
  };
}

class ImperialUnit {
  String id;
  NameEnum name;
  PurpleAbbreviation abbreviation;
  PurplePlural plural;
  PluralAbbreviation pluralAbbreviation;
  Kind kind;
  bool decimal;

  ImperialUnit({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.plural,
    required this.pluralAbbreviation,
    required this.kind,
    required this.decimal,
  });

  factory ImperialUnit.fromJson(Map<String, dynamic> json) => ImperialUnit(
    id: json["id"],
    name: nameEnumValues.map[json["name"]]!,
    abbreviation: purpleAbbreviationValues.map[json["abbreviation"]]!,
    plural: purplePluralValues.map[json["plural"]]!,
    pluralAbbreviation: pluralAbbreviationValues.map[json["pluralAbbreviation"]]!,
    kind: kindValues.map[json["kind"]]!,
    decimal: json["decimal"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameEnumValues.reverse[name],
    "abbreviation": purpleAbbreviationValues.reverse[abbreviation],
    "plural": purplePluralValues.reverse[plural],
    "pluralAbbreviation": pluralAbbreviationValues.reverse[pluralAbbreviation],
    "kind": kindValues.reverse[kind],
    "decimal": decimal,
  };
}

enum PurpleAbbreviation {
  ABBREVIATION_TBSP,
  CLOVE,
  CUP,
  DROP,
  EAR,
  EMPTY,
  G,
  KG,
  LB,
  LITER,
  ML,
  M_L,
  OZ,
  PINCH,
  SLICE,
  TBSP,
  TSP
}

final purpleAbbreviationValues = EnumValues({
  "tbsp": PurpleAbbreviation.ABBREVIATION_TBSP,
  "clove": PurpleAbbreviation.CLOVE,
  "cup": PurpleAbbreviation.CUP,
  "drop": PurpleAbbreviation.DROP,
  "ear": PurpleAbbreviation.EAR,
  "": PurpleAbbreviation.EMPTY,
  "g": PurpleAbbreviation.G,
  "kg": PurpleAbbreviation.KG,
  "lb.": PurpleAbbreviation.LB,
  "liter": PurpleAbbreviation.LITER,
  "ml": PurpleAbbreviation.ML,
  "mL": PurpleAbbreviation.M_L,
  "oz.": PurpleAbbreviation.OZ,
  "pinch": PurpleAbbreviation.PINCH,
  "slice": PurpleAbbreviation.SLICE,
  "Tbsp.": PurpleAbbreviation.TBSP,
  "tsp.": PurpleAbbreviation.TSP
});

enum Kind {
  COUNT,
  MASS,
  VOLUME
}

final kindValues = EnumValues({
  "count": Kind.COUNT,
  "mass": Kind.MASS,
  "volume": Kind.VOLUME
});

enum NameEnum {
  CLOVE,
  CUP,
  DROP,
  EAR,
  EMPTY,
  GRAM,
  KILOGRAM,
  LITER,
  MILLILITER,
  OUNCE,
  PINCH,
  POUND,
  SLICE,
  TABLESPOON,
  TEASPOON
}

final nameEnumValues = EnumValues({
  "clove": NameEnum.CLOVE,
  "cup": NameEnum.CUP,
  "drop": NameEnum.DROP,
  "ear": NameEnum.EAR,
  "": NameEnum.EMPTY,
  "gram": NameEnum.GRAM,
  "kilogram": NameEnum.KILOGRAM,
  "liter": NameEnum.LITER,
  "milliliter": NameEnum.MILLILITER,
  "ounce": NameEnum.OUNCE,
  "pinch": NameEnum.PINCH,
  "pound": NameEnum.POUND,
  "slice": NameEnum.SLICE,
  "tablespoon": NameEnum.TABLESPOON,
  "teaspoon": NameEnum.TEASPOON
});

enum PurplePlural {
  CLOVES,
  CUPS,
  DROPS,
  EARS,
  EMPTY,
  GRAMS,
  KILOGRAMS,
  LITERS,
  MILLILITERS,
  OUNCES,
  PINCHES,
  POUNDS,
  SLICES,
  TABLESPOONS,
  TEASPOONS
}

final purplePluralValues = EnumValues({
  "cloves": PurplePlural.CLOVES,
  "cups": PurplePlural.CUPS,
  "drops": PurplePlural.DROPS,
  "ears": PurplePlural.EARS,
  "": PurplePlural.EMPTY,
  "grams": PurplePlural.GRAMS,
  "kilograms": PurplePlural.KILOGRAMS,
  "liters": PurplePlural.LITERS,
  "milliliters": PurplePlural.MILLILITERS,
  "ounces": PurplePlural.OUNCES,
  "pinches": PurplePlural.PINCHES,
  "pounds": PurplePlural.POUNDS,
  "slices": PurplePlural.SLICES,
  "tablespoons": PurplePlural.TABLESPOONS,
  "teaspoons": PurplePlural.TEASPOONS
});

enum PluralAbbreviation {
  CLOVES,
  CUPS,
  DROPS,
  EARS,
  EMPTY,
  GRAMS,
  KILOGRAMS,
  LB,
  LITERS,
  ML,
  M_L,
  OZ,
  PINCHES,
  SLICES,
  TBSP,
  TBSPS,
  TSP
}

final pluralAbbreviationValues = EnumValues({
  "cloves": PluralAbbreviation.CLOVES,
  "cups": PluralAbbreviation.CUPS,
  "drops": PluralAbbreviation.DROPS,
  "ears": PluralAbbreviation.EARS,
  "": PluralAbbreviation.EMPTY,
  "grams": PluralAbbreviation.GRAMS,
  "kilograms": PluralAbbreviation.KILOGRAMS,
  "lb.": PluralAbbreviation.LB,
  "liters": PluralAbbreviation.LITERS,
  "ml": PluralAbbreviation.ML,
  "mL": PluralAbbreviation.M_L,
  "oz.": PluralAbbreviation.OZ,
  "pinches": PluralAbbreviation.PINCHES,
  "slices": PluralAbbreviation.SLICES,
  "Tbsp.": PluralAbbreviation.TBSP,
  "tbsps": PluralAbbreviation.TBSPS,
  "tsp.": PluralAbbreviation.TSP
});

enum Category {
  BAKERY,
  BAKING_COOKING,
  BREAKFAST_FOODS,
  CANNED_GOODS_SOUPS,
  CONDIMENTS,
  DAIRY,
  DRINKS,
  MEAT,
  PACKAGED_MEALS_SIDE_DISHES,
  PASTA_GRAINS,
  PRODUCE,
  SNACK_FOODS
}

final categoryValues = EnumValues({
  "Bakery": Category.BAKERY,
  "Baking & Cooking": Category.BAKING_COOKING,
  "Breakfast Foods": Category.BREAKFAST_FOODS,
  "Canned Goods & Soups": Category.CANNED_GOODS_SOUPS,
  "Condiments": Category.CONDIMENTS,
  "Dairy": Category.DAIRY,
  "Drinks": Category.DRINKS,
  "Meat": Category.MEAT,
  "Packaged Meals & Side Dishes": Category.PACKAGED_MEALS_SIDE_DISHES,
  "Pasta & Grains": Category.PASTA_GRAINS,
  "Produce": Category.PRODUCE,
  "Snack Foods": Category.SNACK_FOODS
});

class RelatedRecipeSearchTerm {
  String allowedIngredient;

  RelatedRecipeSearchTerm({
    required this.allowedIngredient,
  });

  factory RelatedRecipeSearchTerm.fromJson(Map<String, dynamic> json) => RelatedRecipeSearchTerm(
    allowedIngredient: json["allowedIngredient"],
  );

  Map<String, dynamic> toJson() => {
    "allowedIngredient": allowedIngredient,
  };
}

class MoreContent {
  String mobileSectionName;
  QueryParams queryParams;
  List<dynamic> feed;

  MoreContent({
    required this.mobileSectionName,
    required this.queryParams,
    required this.feed,
  });

  factory MoreContent.fromJson(Map<String, dynamic> json) => MoreContent(
    mobileSectionName: json["mobileSectionName"],
    queryParams: QueryParams.fromJson(json["queryParams"]),
    feed: List<dynamic>.from(json["feed"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "mobileSectionName": mobileSectionName,
    "queryParams": queryParams.toJson(),
    "feed": List<dynamic>.from(feed.map((x) => x)),
  };
}

class QueryParams {
  int start;
  String? authorId;
  String id;
  ApiFeedType apiFeedType;
  RelatedContentType? relatedContentType;

  QueryParams({
    required this.start,
    this.authorId,
    required this.id,
    required this.apiFeedType,
    this.relatedContentType,
  });

  factory QueryParams.fromJson(Map<String, dynamic> json) => QueryParams(
    start: json["start"],
    authorId: json["authorId"],
    id: json["id"],
    apiFeedType: apiFeedTypeValues.map[json["apiFeedType"]]!,
    relatedContentType: relatedContentTypeValues.map[json["relatedContentType"]]!,
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "authorId": authorId,
    "id": id,
    "apiFeedType": apiFeedTypeValues.reverse[apiFeedType],
    "relatedContentType": relatedContentTypeValues.reverse[relatedContentType],
  };
}

enum ApiFeedType {
  MORE_FROM,
  RELATED
}

final apiFeedTypeValues = EnumValues({
  "moreFrom": ApiFeedType.MORE_FROM,
  "related": ApiFeedType.RELATED
});

enum RelatedContentType {
  PRODUCT
}

final relatedContentTypeValues = EnumValues({
  "product": RelatedContentType.PRODUCT
});

class Nutrition {
  NutritionMobileSectionName mobileSectionName;
  List<NutritionEstimate> nutritionEstimates;

  Nutrition({
    required this.mobileSectionName,
    required this.nutritionEstimates,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
    mobileSectionName: nutritionMobileSectionNameValues.map[json["mobileSectionName"]]!,
    nutritionEstimates: List<NutritionEstimate>.from(json["nutritionEstimates"].map((x) => NutritionEstimate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "mobileSectionName": nutritionMobileSectionNameValues.reverse[mobileSectionName],
    "nutritionEstimates": List<dynamic>.from(nutritionEstimates.map((x) => x.toJson())),
  };
}

enum NutritionMobileSectionName {
  NUTRITION
}

final nutritionMobileSectionNameValues = EnumValues({
  "Nutrition": NutritionMobileSectionName.NUTRITION
});

class NutritionEstimate {
  Attribute attribute;
  double value;
  NutritionEstimateUnit unit;
  NutritionEstimateDisplay display;

  NutritionEstimate({
    required this.attribute,
    required this.value,
    required this.unit,
    required this.display,
  });

  factory NutritionEstimate.fromJson(Map<String, dynamic> json) => NutritionEstimate(
    attribute: attributeValues.map[json["attribute"]]!,
    value: json["value"]?.toDouble(),
    unit: NutritionEstimateUnit.fromJson(json["unit"]),
    display: NutritionEstimateDisplay.fromJson(json["display"]),
  );

  Map<String, dynamic> toJson() => {
    "attribute": attributeValues.reverse[attribute],
    "value": value,
    "unit": unit.toJson(),
    "display": display.toJson(),
  };
}

enum Attribute {
  CA,
  CHOCDF,
  CHOLE,
  ENERC_KCAL,
  FASAT,
  FAT,
  FATRN,
  FAT_KCAL,
  FE,
  FIBTG,
  K,
  NA,
  PROCNT,
  SUGAR,
  VITA_IU,
  VITC
}

final attributeValues = EnumValues({
  "CA": Attribute.CA,
  "CHOCDF": Attribute.CHOCDF,
  "CHOLE": Attribute.CHOLE,
  "ENERC_KCAL": Attribute.ENERC_KCAL,
  "FASAT": Attribute.FASAT,
  "FAT": Attribute.FAT,
  "FATRN": Attribute.FATRN,
  "FAT_KCAL": Attribute.FAT_KCAL,
  "FE": Attribute.FE,
  "FIBTG": Attribute.FIBTG,
  "K": Attribute.K,
  "NA": Attribute.NA,
  "PROCNT": Attribute.PROCNT,
  "SUGAR": Attribute.SUGAR,
  "VITA_IU": Attribute.VITA_IU,
  "VITC": Attribute.VITC
});

class NutritionEstimateDisplay {
  dynamic value;
  DisplayUnit? unit;
  int? percentDailyValue;

  NutritionEstimateDisplay({
    required this.value,
    required this.unit,
    required this.percentDailyValue,
  });

  factory NutritionEstimateDisplay.fromJson(Map<String, dynamic> json) => NutritionEstimateDisplay(
    value: json["value"],
    unit: displayUnitValues.map[json["unit"]]!,
    percentDailyValue: json["percentDailyValue"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "unit": displayUnitValues.reverse[unit],
    "percentDailyValue": percentDailyValue,
  };
}

enum DisplayUnit {
  G,
  MG
}

final displayUnitValues = EnumValues({
  "g": DisplayUnit.G,
  "mg": DisplayUnit.MG
});

class NutritionEstimateUnit {
  Name name;
  FluffyAbbreviation abbreviation;
  FluffyPlural plural;
  bool decimal;

  NutritionEstimateUnit({
    required this.name,
    required this.abbreviation,
    required this.plural,
    required this.decimal,
  });

  factory NutritionEstimateUnit.fromJson(Map<String, dynamic> json) => NutritionEstimateUnit(
    name: nameValues.map[json["name"]]!,
    abbreviation: fluffyAbbreviationValues.map[json["abbreviation"]]!,
    plural: fluffyPluralValues.map[json["plural"]]!,
    decimal: json["decimal"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "abbreviation": fluffyAbbreviationValues.reverse[abbreviation],
    "plural": fluffyPluralValues.reverse[plural],
    "decimal": decimal,
  };
}

enum FluffyAbbreviation {
  G,
  IU,
  KCAL
}

final fluffyAbbreviationValues = EnumValues({
  "g": FluffyAbbreviation.G,
  "IU": FluffyAbbreviation.IU,
  "kcal": FluffyAbbreviation.KCAL
});

enum Name {
  CALORIE,
  GRAM,
  IU
}

final nameValues = EnumValues({
  "calorie": Name.CALORIE,
  "gram": Name.GRAM,
  "IU": Name.IU
});

enum FluffyPlural {
  CALORIES,
  GRAMS,
  IU
}

final fluffyPluralValues = EnumValues({
  "calories": FluffyPlural.CALORIES,
  "grams": FluffyPlural.GRAMS,
  "IU": FluffyPlural.IU
});

class Reviews {
  ReviewsMobileSectionName mobileSectionName;
  int totalReviewCount;
  double averageRating;
  List<dynamic> reviews;
  dynamic thisUserReview;
  SortBy sortBy;

  Reviews({
    required this.mobileSectionName,
    required this.totalReviewCount,
    required this.averageRating,
    required this.reviews,
    required this.thisUserReview,
    required this.sortBy,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    mobileSectionName: reviewsMobileSectionNameValues.map[json["mobileSectionName"]]!,
    totalReviewCount: json["totalReviewCount"],
    averageRating: json["averageRating"]?.toDouble(),
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
    thisUserReview: json["thisUserReview"],
    sortBy: sortByValues.map[json["sortBy"]]!,
  );

  Map<String, dynamic> toJson() => {
    "mobileSectionName": reviewsMobileSectionNameValues.reverse[mobileSectionName],
    "totalReviewCount": totalReviewCount,
    "averageRating": averageRating,
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
    "thisUserReview": thisUserReview,
    "sortBy": sortByValues.reverse[sortBy],
  };
}

enum ReviewsMobileSectionName {
  REVIEWS
}

final reviewsMobileSectionNameValues = EnumValues({
  "Reviews": ReviewsMobileSectionName.REVIEWS
});

enum SortBy {
  CREATE_TIME
}

final sortByValues = EnumValues({
  "create-time": SortBy.CREATE_TIME
});

class Tags {
  List<Course>? course;
  List<Course>? dish;
  List<Course>? equipment;
  List<Course>? nutrition;
  List<Course>? technique;
  List<Course>? cuisine;
  List<Course>? difficulty;

  Tags({
    this.course,
    this.dish,
    this.equipment,
    this.nutrition,
    this.technique,
    this.cuisine,
    this.difficulty,
  });

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
    course: json["course"] == null ? [] : List<Course>.from(json["course"]!.map((x) => Course.fromJson(x))),
    dish: json["dish"] == null ? [] : List<Course>.from(json["dish"]!.map((x) => Course.fromJson(x))),
    equipment: json["equipment"] == null ? [] : List<Course>.from(json["equipment"]!.map((x) => Course.fromJson(x))),
    nutrition: json["nutrition"] == null ? [] : List<Course>.from(json["nutrition"]!.map((x) => Course.fromJson(x))),
    technique: json["technique"] == null ? [] : List<Course>.from(json["technique"]!.map((x) => Course.fromJson(x))),
    cuisine: json["cuisine"] == null ? [] : List<Course>.from(json["cuisine"]!.map((x) => Course.fromJson(x))),
    difficulty: json["difficulty"] == null ? [] : List<Course>.from(json["difficulty"]!.map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "course": course == null ? [] : List<dynamic>.from(course!.map((x) => x.toJson())),
    "dish": dish == null ? [] : List<dynamic>.from(dish!.map((x) => x.toJson())),
    "equipment": equipment == null ? [] : List<dynamic>.from(equipment!.map((x) => x.toJson())),
    "nutrition": nutrition == null ? [] : List<dynamic>.from(nutrition!.map((x) => x.toJson())),
    "technique": technique == null ? [] : List<dynamic>.from(technique!.map((x) => x.toJson())),
    "cuisine": cuisine == null ? [] : List<dynamic>.from(cuisine!.map((x) => x.toJson())),
    "difficulty": difficulty == null ? [] : List<dynamic>.from(difficulty!.map((x) => x.toJson())),
  };
}

class Course {
  String displayName;
  String tagUrl;

  Course({
    required this.displayName,
    required this.tagUrl,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    displayName: json["display-name"],
    tagUrl: json["tag-url"],
  );

  Map<String, dynamic> toJson() => {
    "display-name": displayName,
    "tag-url": tagUrl,
  };
}

class TagsAds {
  List<Course>? adtag;

  TagsAds({
    this.adtag,
  });

  factory TagsAds.fromJson(Map<String, dynamic> json) => TagsAds(
    adtag: json["adtag"] == null ? [] : List<Course>.from(json["adtag"]!.map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "adtag": adtag == null ? [] : List<dynamic>.from(adtag!.map((x) => x.toJson())),
  };
}

enum UnitSystem {
  IMPERIAL,
  METRIC
}

final unitSystemValues = EnumValues({
  "imperial": UnitSystem.IMPERIAL,
  "metric": UnitSystem.METRIC
});

class Yums {
  int count;
  ThisUser thisUser;

  Yums({
    required this.count,
    required this.thisUser,
  });

  factory Yums.fromJson(Map<String, dynamic> json) => Yums(
    count: json["count"],
    thisUser: thisUserValues.map[json["this-user"]]!,
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "this-user": thisUserValues.reverse[thisUser],
  };
}

enum ThisUser {
  NONE
}

final thisUserValues = EnumValues({
  "none": ThisUser.NONE
});

class FeedDisplay {
  String displayName;
  List<String> images;
  String flag;
  Source source;
  List<Profile> profiles;
  dynamic displayPrepStepsInline;
  List<dynamic> collections;

  FeedDisplay({
    required this.displayName,
    required this.images,
    required this.flag,
    required this.source,
    required this.profiles,
    required this.displayPrepStepsInline,
    required this.collections,
  });

  factory FeedDisplay.fromJson(Map<String, dynamic> json) => FeedDisplay(
    displayName: json["displayName"],
    images: List<String>.from(json["images"].map((x) => x)),
    flag: json["flag"],
    source: Source.fromJson(json["source"]),
    profiles: List<Profile>.from(json["profiles"].map((x) => Profile.fromJson(x))),
    displayPrepStepsInline: json["displayPrepStepsInline"],
    collections: List<dynamic>.from(json["collections"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "displayName": displayName,
    "images": List<dynamic>.from(images.map((x) => x)),
    "flag": flag,
    "source": source.toJson(),
    "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
    "displayPrepStepsInline": displayPrepStepsInline,
    "collections": List<dynamic>.from(collections.map((x) => x)),
  };
}

class Profile {
  String profileName;
  String displayName;
  String siteUrl;
  String pictureUrl;
  String pageUrl;
  String? description;
  ProfileType type;
  String profileUrl;

  Profile({
    required this.profileName,
    required this.displayName,
    required this.siteUrl,
    required this.pictureUrl,
    required this.pageUrl,
    required this.description,
    required this.type,
    required this.profileUrl,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    profileName: json["profileName"],
    displayName: json["displayName"],
    siteUrl: json["siteUrl"],
    pictureUrl: json["pictureUrl"],
    pageUrl: json["pageUrl"],
    description: json["description"],
    type: profileTypeValues.map[json["type"]]!,
    profileUrl: json["profileUrl"],
  );

  Map<String, dynamic> toJson() => {
    "profileName": profileName,
    "displayName": displayName,
    "siteUrl": siteUrl,
    "pictureUrl": pictureUrl,
    "pageUrl": pageUrl,
    "description": description,
    "type": profileTypeValues.reverse[type],
    "profileUrl": profileUrl,
  };
}

enum ProfileType {
  CONTENT_OWNER
}

final profileTypeValues = EnumValues({
  "content-owner": ProfileType.CONTENT_OWNER
});

class Source {
  String sourceRecipeUrl;
  String? sourceFaviconUrl;
  bool sourceHttpsOk;
  bool sourceInFrame;
  String sourceDisplayName;
  dynamic proSource;
  String sourceSiteUrl;
  IntroVideo introVideo;
  dynamic eyebrowText;
  String sourcePageUrl;
  dynamic marketingCopy;
  bool sourceHttpOk;
  dynamic marketingImage;

  Source({
    required this.sourceRecipeUrl,
    required this.sourceFaviconUrl,
    required this.sourceHttpsOk,
    required this.sourceInFrame,
    required this.sourceDisplayName,
    required this.proSource,
    required this.sourceSiteUrl,
    required this.introVideo,
    required this.eyebrowText,
    required this.sourcePageUrl,
    required this.marketingCopy,
    required this.sourceHttpOk,
    required this.marketingImage,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    sourceRecipeUrl: json["sourceRecipeUrl"],
    sourceFaviconUrl: json["sourceFaviconUrl"],
    sourceHttpsOk: json["sourceHttpsOk"],
    sourceInFrame: json["sourceInFrame"],
    sourceDisplayName: json["sourceDisplayName"],
    proSource: json["proSource"],
    sourceSiteUrl: json["sourceSiteUrl"],
    introVideo: IntroVideo.fromJson(json["introVideo"]),
    eyebrowText: json["eyebrowText"],
    sourcePageUrl: json["sourcePageUrl"],
    marketingCopy: json["marketingCopy"],
    sourceHttpOk: json["sourceHttpOk"],
    marketingImage: json["marketingImage"],
  );

  Map<String, dynamic> toJson() => {
    "sourceRecipeUrl": sourceRecipeUrl,
    "sourceFaviconUrl": sourceFaviconUrl,
    "sourceHttpsOk": sourceHttpsOk,
    "sourceInFrame": sourceInFrame,
    "sourceDisplayName": sourceDisplayName,
    "proSource": proSource,
    "sourceSiteUrl": sourceSiteUrl,
    "introVideo": introVideo.toJson(),
    "eyebrowText": eyebrowText,
    "sourcePageUrl": sourcePageUrl,
    "marketingCopy": marketingCopy,
    "sourceHttpOk": sourceHttpOk,
    "marketingImage": marketingImage,
  };
}

class IntroVideo {
  dynamic id;
  dynamic originalUrl;
  dynamic hlsUrl;
  dynamic dashUrl;
  dynamic hasAudio;
  Snapshot snapshot;

  IntroVideo({
    required this.id,
    required this.originalUrl,
    required this.hlsUrl,
    required this.dashUrl,
    required this.hasAudio,
    required this.snapshot,
  });

  factory IntroVideo.fromJson(Map<String, dynamic> json) => IntroVideo(
    id: json["id"],
    originalUrl: json["originalUrl"],
    hlsUrl: json["hlsUrl"],
    dashUrl: json["dashUrl"],
    hasAudio: json["hasAudio"],
    snapshot: Snapshot.fromJson(json["snapshot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "originalUrl": originalUrl,
    "hlsUrl": hlsUrl,
    "dashUrl": dashUrl,
    "hasAudio": hasAudio,
    "snapshot": snapshot.toJson(),
  };
}

class Snapshot {
  dynamic original;
  dynamic resizable;

  Snapshot({
    required this.original,
    required this.resizable,
  });

  factory Snapshot.fromJson(Map<String, dynamic> json) => Snapshot(
    original: json["original"],
    resizable: json["resizable"],
  );

  Map<String, dynamic> toJson() => {
    "original": original,
    "resizable": resizable,
  };
}

enum Locale {
  EN_US
}

final localeValues = EnumValues({
  "en-US": Locale.EN_US
});

enum RecipeType {
  BASIC_RECIPE
}

final recipeTypeValues = EnumValues({
  "BasicRecipe": RecipeType.BASIC_RECIPE
});

class FeedSeo {
  Web web;
  SpotlightSearch spotlightSearch;
  Firebase firebase;

  FeedSeo({
    required this.web,
    required this.spotlightSearch,
    required this.firebase,
  });

  factory FeedSeo.fromJson(Map<String, dynamic> json) => FeedSeo(
    web: Web.fromJson(json["web"]),
    spotlightSearch: SpotlightSearch.fromJson(json["spotlightSearch"]),
    firebase: Firebase.fromJson(json["firebase"]),
  );

  Map<String, dynamic> toJson() => {
    "web": web.toJson(),
    "spotlightSearch": spotlightSearch.toJson(),
    "firebase": firebase.toJson(),
  };
}

class Firebase {
  bool noindex;

  Firebase({
    required this.noindex,
  });

  factory Firebase.fromJson(Map<String, dynamic> json) => Firebase(
    noindex: json["noindex"],
  );

  Map<String, dynamic> toJson() => {
    "noindex": noindex,
  };
}

class SpotlightSearch {
  List<String> keywords;
  bool noindex;

  SpotlightSearch({
    required this.keywords,
    required this.noindex,
  });

  factory SpotlightSearch.fromJson(Map<String, dynamic> json) => SpotlightSearch(
    keywords: List<String>.from(json["keywords"].map((x) => x)),
    noindex: json["noindex"],
  );

  Map<String, dynamic> toJson() => {
    "keywords": List<dynamic>.from(keywords.map((x) => x)),
    "noindex": noindex,
  };
}

class Web {
  bool noindex;
  String canonicalTerm;
  MetaTags metaTags;
  List<LinkTag> linkTags;
  String imageUrl;

  Web({
    required this.noindex,
    required this.canonicalTerm,
    required this.metaTags,
    required this.linkTags,
    required this.imageUrl,
  });

  factory Web.fromJson(Map<String, dynamic> json) => Web(
    noindex: json["noindex"],
    canonicalTerm: json["canonical-term"],
    metaTags: MetaTags.fromJson(json["meta-tags"]),
    linkTags: List<LinkTag>.from(json["link-tags"].map((x) => LinkTag.fromJson(x))),
    imageUrl: json["image-url"],
  );

  Map<String, dynamic> toJson() => {
    "noindex": noindex,
    "canonical-term": canonicalTerm,
    "meta-tags": metaTags.toJson(),
    "link-tags": List<dynamic>.from(linkTags.map((x) => x.toJson())),
    "image-url": imageUrl,
  };
}

class LinkTag {
  Rel rel;
  String href;
  Hreflang? hreflang;

  LinkTag({
    required this.rel,
    required this.href,
    this.hreflang,
  });

  factory LinkTag.fromJson(Map<String, dynamic> json) => LinkTag(
    rel: relValues.map[json["rel"]]!,
    href: json["href"],
    hreflang: hreflangValues.map[json["hreflang"]]!,
  );

  Map<String, dynamic> toJson() => {
    "rel": relValues.reverse[rel],
    "href": href,
    "hreflang": hreflangValues.reverse[hreflang],
  };
}

enum Hreflang {
  EN,
  EN_GB
}

final hreflangValues = EnumValues({
  "en": Hreflang.EN,
  "en-GB": Hreflang.EN_GB
});

enum Rel {
  ALTERNATE,
  CANONICAL
}

final relValues = EnumValues({
  "alternate": Rel.ALTERNATE,
  "canonical": Rel.CANONICAL
});

class MetaTags {
  String title;
  String description;

  MetaTags({
    required this.title,
    required this.description,
  });

  factory MetaTags.fromJson(Map<String, dynamic> json) => MetaTags(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}

enum TrackingId {
  RECIPE_TEST_MODEL_COLLABORATIVE
}

final trackingIdValues = EnumValues({
  "recipe:test,model:collaborative": TrackingId.RECIPE_TEST_MODEL_COLLABORATIVE
});

enum FeedType {
  SINGLE_RECIPE
}

final feedTypeValues = EnumValues({
  "single recipe": FeedType.SINGLE_RECIPE
});

class FoodApiModelSeo {
  Firebase? web;
  Firebase? spotlightSearch;
  Firebase? firebase;

  FoodApiModelSeo({
     this.web,this.spotlightSearch,this.firebase,
  });

  factory FoodApiModelSeo.fromJson(Map<String, dynamic> json) => FoodApiModelSeo(
    web: Firebase.fromJson(json["web"]),
    spotlightSearch: Firebase.fromJson(json["spotlightSearch"]),
    firebase: Firebase.fromJson(json["firebase"]),
  );

  Map<String, dynamic> toJson() => {
    "web": web?.toJson(),
    "spotlightSearch": spotlightSearch?.toJson(),
    "firebase": firebase?.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
