class LoginResponse {
  String token;
  Null errMsg;
  int errCode;
  Profile profile;
  List<Rolmnulst> rolmnulst;
  Null landingpage;

  LoginResponse(
      {this.token,
        this.errMsg,
        this.errCode,
        this.profile,
        this.rolmnulst,
        this.landingpage});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    errMsg = json['err_msg'];
    errCode = json['err_code'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['rolmnulst'] != null) {
      rolmnulst = new List<Rolmnulst>();
      json['rolmnulst'].forEach((v) {
        rolmnulst.add(new Rolmnulst.fromJson(v));
      });
    }
    landingpage = json['landingpage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['err_msg'] = this.errMsg;
    data['err_code'] = this.errCode;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.rolmnulst != null) {
      data['rolmnulst'] = this.rolmnulst.map((v) => v.toJson()).toList();
    }
    data['landingpage'] = this.landingpage;
    return data;
  }
}

class Profile {
  int custId;
  String email;
  String address;
  String description;
  String customerCategory;
  String pwd;
  bool isActive;
  String lastUpdateBy;
  int lastUpdateTime;
  String phoneNumber;
  double custLocLat;
  double custLocLng;
  String firstName;
  String lastName;
  String profileImage;
  Null languagePreference;
  int pincode;
  Null city;
  Null country;
  List<ListOfRole> listOfRole;
  int companyid;
  int defcompanyid;
  int defroute;
  CustType custType;
  CustCat custCat;

  Profile(
      {this.custId,
        this.email,
        this.address,
        this.description,
        this.customerCategory,
        this.pwd,
        this.isActive,
        this.lastUpdateBy,
        this.lastUpdateTime,
        this.phoneNumber,
        this.custLocLat,
        this.custLocLng,
        this.firstName,
        this.lastName,
        this.profileImage,
        this.languagePreference,
        this.pincode,
        this.city,
        this.country,
        this.listOfRole,
        this.companyid,
        this.defcompanyid,
        this.defroute,
        this.custType,
        this.custCat});

  Profile.fromJson(Map<String, dynamic> json) {
    custId = json['custId'];
    email = json['email'];
    address = json['address'];
    description = json['description'];
    customerCategory = json['customerCategory'];
    pwd = json['pwd'];
    isActive = json['isActive'];
    lastUpdateBy = json['last_update_by'];
    lastUpdateTime = json['last_update_time'];
    phoneNumber = json['phoneNumber'];
    custLocLat = json['cust_loc_lat'];
    custLocLng = json['cust_loc_lng'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profileImage = json['profileImage'];
    languagePreference = json['languagePreference'];
    pincode = json['pincode'];
    city = json['city'];
    country = json['country'];
    if (json['listOfRole'] != null) {
      listOfRole = new List<ListOfRole>();
      json['listOfRole'].forEach((v) {
        listOfRole.add(new ListOfRole.fromJson(v));
      });
    }
    companyid = json['companyid'];
    defcompanyid = json['defcompanyid'];
    defroute = json['defroute'];
    custType = json['custType'] != null
        ? new CustType.fromJson(json['custType'])
        : null;
    custCat =
    json['custCat'] != null ? new CustCat.fromJson(json['custCat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custId'] = this.custId;
    data['email'] = this.email;
    data['address'] = this.address;
    data['description'] = this.description;
    data['customerCategory'] = this.customerCategory;
    data['pwd'] = this.pwd;
    data['isActive'] = this.isActive;
    data['last_update_by'] = this.lastUpdateBy;
    data['last_update_time'] = this.lastUpdateTime;
    data['phoneNumber'] = this.phoneNumber;
    data['cust_loc_lat'] = this.custLocLat;
    data['cust_loc_lng'] = this.custLocLng;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['profileImage'] = this.profileImage;
    data['languagePreference'] = this.languagePreference;
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    data['country'] = this.country;
    if (this.listOfRole != null) {
      data['listOfRole'] = this.listOfRole.map((v) => v.toJson()).toList();
    }
    data['companyid'] = this.companyid;
    data['defcompanyid'] = this.defcompanyid;
    data['defroute'] = this.defroute;
    if (this.custType != null) {
      data['custType'] = this.custType.toJson();
    }
    if (this.custCat != null) {
      data['custCat'] = this.custCat.toJson();
    }
    return data;
  }
}

class ListOfRole {
  int roleId;
  String role;
  int isActive;
  String lastUpdateBy;
  int lastUpdateTime;

  ListOfRole(
      {this.roleId,
        this.role,
        this.isActive,
        this.lastUpdateBy,
        this.lastUpdateTime});

  ListOfRole.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    role = json['role'];
    isActive = json['isActive'];
    lastUpdateBy = json['last_update_by'];
    lastUpdateTime = json['last_update_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleId'] = this.roleId;
    data['role'] = this.role;
    data['isActive'] = this.isActive;
    data['last_update_by'] = this.lastUpdateBy;
    data['last_update_time'] = this.lastUpdateTime;
    return data;
  }
}

class CustType {
  int custTypeId;
  String custTypeName;
  int custTypeRefid;

  CustType({this.custTypeId, this.custTypeName, this.custTypeRefid});

  CustType.fromJson(Map<String, dynamic> json) {
    custTypeId = json['custTypeId'];
    custTypeName = json['custTypeName'];
    custTypeRefid = json['custTypeRefid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custTypeId'] = this.custTypeId;
    data['custTypeName'] = this.custTypeName;
    data['custTypeRefid'] = this.custTypeRefid;
    return data;
  }
}

class CustCat {
  int custCatTypeId;
  String custCatTypeName;
  int custCatRefId;

  CustCat({this.custCatTypeId, this.custCatTypeName, this.custCatRefId});

  CustCat.fromJson(Map<String, dynamic> json) {
    custCatTypeId = json['custCatTypeId'];
    custCatTypeName = json['custCatTypeName'];
    custCatRefId = json['custCatRefId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custCatTypeId'] = this.custCatTypeId;
    data['custCatTypeName'] = this.custCatTypeName;
    data['custCatRefId'] = this.custCatRefId;
    return data;
  }
}

class Rolmnulst {
  ListOfRole role;
  List<Menulst> menulst;
  List<Transauth> transauth;

  Rolmnulst({this.role, this.menulst, this.transauth});

  Rolmnulst.fromJson(Map<String, dynamic> json) {
    role = json['role'] != null ? new ListOfRole.fromJson(json['role']) : null;
    if (json['menulst'] != null) {
      menulst = new List<Menulst>();
      json['menulst'].forEach((v) {
        menulst.add(new Menulst.fromJson(v));
      });
    }
    if (json['transauth'] != null) {
      transauth = new List<Transauth>();
      json['transauth'].forEach((v) {
        transauth.add(new Transauth.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.role != null) {
      data['role'] = this.role.toJson();
    }
    if (this.menulst != null) {
      data['menulst'] = this.menulst.map((v) => v.toJson()).toList();
    }
    if (this.transauth != null) {
      data['transauth'] = this.transauth.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menulst {
  int id;
  String dispName;
  int mobMenuId;
  String type;
  String iconStr;
  String menuId;

  Menulst(
      {this.id,
        this.dispName,
        this.mobMenuId,
        this.type,
        this.iconStr,
        this.menuId});

  Menulst.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dispName = json['dispName'];
    mobMenuId = json['mobMenuId'];
    type = json['type'];
    iconStr = json['iconStr'];
    menuId = json['menuId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dispName'] = this.dispName;
    data['mobMenuId'] = this.mobMenuId;
    data['type'] = this.type;
    data['iconStr'] = this.iconStr;
    data['menuId'] = this.menuId;
    return data;
  }
}

class Transauth {
  Transstage transstage;
  bool canManage;
  bool canExecute;

  Transauth({this.transstage, this.canManage, this.canExecute});

  Transauth.fromJson(Map<String, dynamic> json) {
    transstage = json['transstage'] != null
        ? new Transstage.fromJson(json['transstage'])
        : null;
    canManage = json['canManage'];
    canExecute = json['canExecute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transstage != null) {
      data['transstage'] = this.transstage.toJson();
    }
    data['canManage'] = this.canManage;
    data['canExecute'] = this.canExecute;
    return data;
  }
}

class Transstage {
  int transstgId;
  String transId;
  String stageId;
  String lastUpdateBy;
  int lastUpdateTime;

  Transstage(
      {this.transstgId,
        this.transId,
        this.stageId,
        this.lastUpdateBy,
        this.lastUpdateTime});

  Transstage.fromJson(Map<String, dynamic> json) {
    transstgId = json['transstgId'];
    transId = json['transId'];
    stageId = json['stageId'];
    lastUpdateBy = json['last_update_by'];
    lastUpdateTime = json['last_update_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transstgId'] = this.transstgId;
    data['transId'] = this.transId;
    data['stageId'] = this.stageId;
    data['last_update_by'] = this.lastUpdateBy;
    data['last_update_time'] = this.lastUpdateTime;
    return data;
  }
}
