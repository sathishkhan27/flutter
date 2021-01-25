class ProductList {
  int currentPage;
  int totalNoOfPages;
  int totalNoOfElements;
  Null prodList;
  List<ProdListVO> prodListVO;

  ProductList(
      {this.currentPage,
        this.totalNoOfPages,
        this.totalNoOfElements,
        this.prodList,
        this.prodListVO});

  ProductList.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    totalNoOfPages = json['totalNoOfPages'];
    totalNoOfElements = json['totalNoOfElements'];
    prodList = json['prodList'];
    if (json['prodListVO'] != null) {
      prodListVO = new List<ProdListVO>();
      json['prodListVO'].forEach((v) {
        prodListVO.add(new ProdListVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['totalNoOfPages'] = this.totalNoOfPages;
    data['totalNoOfElements'] = this.totalNoOfElements;
    data['prodList'] = this.prodList;
    if (this.prodListVO != null) {
      data['prodListVO'] = this.prodListVO.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProdListVO {
  int productId;
  String productName;
  Null imageName;
  String productImage;
  Category category;
  String company;
  int unitWholesalePrice;
  int unitRetailPrice;
  int unitPriceMrp;
  String lastUpdateBy;
  int lastUpdateTime;
  int versionNum;
  String productDesc;
  int status;
  CartDetails cartDetails;
  String vidUrl;
  int companyId;
  int offerPrice;
  Proddiscount proddiscount;
  String tmProductName;
  int units;
  String uom;

  ProdListVO(
      {this.productId,
        this.productName,
        this.imageName,
        this.productImage,
        this.category,
        this.company,
        this.unitWholesalePrice,
        this.unitRetailPrice,
        this.unitPriceMrp,
        this.lastUpdateBy,
        this.lastUpdateTime,
        this.versionNum,
        this.productDesc,
        this.status,
        this.cartDetails,
        this.vidUrl,
        this.companyId,
        this.offerPrice,
        this.proddiscount,
        this.tmProductName,
        this.units,
        this.uom});

  ProdListVO.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    imageName = json['imageName'];
    productImage = json['productImage'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    company = json['company'];
    unitWholesalePrice = json['unit_wholesale_price'];
    unitRetailPrice = json['unit_retail_price'];
    unitPriceMrp = json['unit_price_mrp'];
    lastUpdateBy = json['last_update_by'];
    lastUpdateTime = json['last_update_time'];
    versionNum = json['versionNum'];
    productDesc = json['product_desc'];
    status = json['status'];
    cartDetails = json['cartDetails'] != null
        ? new CartDetails.fromJson(json['cartDetails'])
        : null;
    vidUrl = json['vid_url'];
    companyId = json['companyId'];
    offerPrice = json['offerPrice'];
    proddiscount = json['proddiscount'] != null
        ? new Proddiscount.fromJson(json['proddiscount'])
        : null;
    tmProductName = json['tm_productName'];
    units = json['units'];
    uom = json['uom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['imageName'] = this.imageName;
    data['productImage'] = this.productImage;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['company'] = this.company;
    data['unit_wholesale_price'] = this.unitWholesalePrice;
    data['unit_retail_price'] = this.unitRetailPrice;
    data['unit_price_mrp'] = this.unitPriceMrp;
    data['last_update_by'] = this.lastUpdateBy;
    data['last_update_time'] = this.lastUpdateTime;
    data['versionNum'] = this.versionNum;
    data['product_desc'] = this.productDesc;
    data['status'] = this.status;
    if (this.cartDetails != null) {
      data['cartDetails'] = this.cartDetails.toJson();
    }
    data['vid_url'] = this.vidUrl;
    data['companyId'] = this.companyId;
    data['offerPrice'] = this.offerPrice;
    if (this.proddiscount != null) {
      data['proddiscount'] = this.proddiscount.toJson();
    }
    data['tm_productName'] = this.tmProductName;
    data['units'] = this.units;
    data['uom'] = this.uom;
    return data;
  }
}

class Category {
  int catId;
  String catName;
  String tmCatName;
  String description;
  int parentCatId;
  String lastUpdateBy;
  int lastUpdateTime;

  Category(
      {this.catId,
        this.catName,
        this.tmCatName,
        this.description,
        this.parentCatId,
        this.lastUpdateBy,
        this.lastUpdateTime});

  Category.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['catName'];
    tmCatName = json['tm_catName'];
    description = json['description'];
    parentCatId = json['parentCatId'];
    lastUpdateBy = json['last_update_by'];
    lastUpdateTime = json['last_update_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['catName'] = this.catName;
    data['tm_catName'] = this.tmCatName;
    data['description'] = this.description;
    data['parentCatId'] = this.parentCatId;
    data['last_update_by'] = this.lastUpdateBy;
    data['last_update_time'] = this.lastUpdateTime;
    return data;
  }
}

class CartDetails {
  int newCat;

  CartDetails({this.newCat});

  CartDetails.fromJson(Map<String, dynamic> json) {
    newCat = json['new cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['new cat'] = this.newCat;
    return data;
  }
}

class Proddiscount {
  int discDetId;
  DiscId discId;
  int catId;
  int productId;
  DiscRule discRule;
  String lastUpdatedBy;
  int lastUpdatedTime;

  Proddiscount(
      {this.discDetId,
        this.discId,
        this.catId,
        this.productId,
        this.discRule,
        this.lastUpdatedBy,
        this.lastUpdatedTime});

  Proddiscount.fromJson(Map<String, dynamic> json) {
    discDetId = json['discDetId'];
    discId =
    json['discId'] != null ? new DiscId.fromJson(json['discId']) : null;
    catId = json['cat_id'];
    productId = json['productId'];
    discRule = json['discRule'] != null
        ? new DiscRule.fromJson(json['discRule'])
        : null;
    lastUpdatedBy = json['last_updated_by'];
    lastUpdatedTime = json['last_updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discDetId'] = this.discDetId;
    if (this.discId != null) {
      data['discId'] = this.discId.toJson();
    }
    data['cat_id'] = this.catId;
    data['productId'] = this.productId;
    if (this.discRule != null) {
      data['discRule'] = this.discRule.toJson();
    }
    data['last_updated_by'] = this.lastUpdatedBy;
    data['last_updated_time'] = this.lastUpdatedTime;
    return data;
  }
}

class DiscId {
  int discId;
  String discountName;
  int validFrom;
  int validTo;
  String discType;
  String status;
  String lastUpdatedBy;
  int lastUpdatedTime;

  DiscId(
      {this.discId,
        this.discountName,
        this.validFrom,
        this.validTo,
        this.discType,
        this.status,
        this.lastUpdatedBy,
        this.lastUpdatedTime});

  DiscId.fromJson(Map<String, dynamic> json) {
    discId = json['discId'];
    discountName = json['discountName'];
    validFrom = json['validFrom'];
    validTo = json['validTo'];
    discType = json['discType'];
    status = json['status'];
    lastUpdatedBy = json['last_updated_by'];
    lastUpdatedTime = json['last_updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discId'] = this.discId;
    data['discountName'] = this.discountName;
    data['validFrom'] = this.validFrom;
    data['validTo'] = this.validTo;
    data['discType'] = this.discType;
    data['status'] = this.status;
    data['last_updated_by'] = this.lastUpdatedBy;
    data['last_updated_time'] = this.lastUpdatedTime;
    return data;
  }
}

class DiscRule {
  int discRuleId;
  String discRuleType;
  int minPrice;
  int minQty;
  int unit;
  String lastUpdatedBy;
  int lastUpdatedTime;

  DiscRule(
      {this.discRuleId,
        this.discRuleType,
        this.minPrice,
        this.minQty,
        this.unit,
        this.lastUpdatedBy,
        this.lastUpdatedTime});

  DiscRule.fromJson(Map<String, dynamic> json) {
    discRuleId = json['discRuleId'];
    discRuleType = json['discRuleType'];
    minPrice = json['minPrice'];
    minQty = json['minQty'];
    unit = json['unit'];
    lastUpdatedBy = json['last_updated_by'];
    lastUpdatedTime = json['last_updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discRuleId'] = this.discRuleId;
    data['discRuleType'] = this.discRuleType;
    data['minPrice'] = this.minPrice;
    data['minQty'] = this.minQty;
    data['unit'] = this.unit;
    data['last_updated_by'] = this.lastUpdatedBy;
    data['last_updated_time'] = this.lastUpdatedTime;
    return data;
  }
}
