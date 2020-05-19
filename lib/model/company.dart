/// id : 1
/// avatar : "hello"
/// name : "Abc"
/// description : "hello"
/// establishedDate : "hello"
/// email : "babuamuda@gmail.com"
/// mobile : "8667710055"
/// fax : "hello"
/// website : "hello"
/// officeType : "REGISTERED OFFICE"
/// addresslineone : "174 Emayam"
/// addresslinetwo : "hello"
/// country : "india"
/// state : "Tamil Nadu"
/// zip : "600101"
/// createdBy : "babuamuda@gmail.com"
/// lastUpdatedBy : "babuamuda@gmail.com"
/// dateCreated : "2020-05-16T08:33:04Z"
/// lastUpdated : "2020-05-16T08:33:04Z"

class Company {
  int id;
  String avatar;
  String name;
  String description;
  String establishedDate;
  String email;
  String mobile;
  String fax;
  String website;
  String officeType;
  String addresslineone;
  String addresslinetwo;
  String country;
  String state;
  String zip;
  String createdBy;
  String lastUpdatedBy;
  String dateCreated;
  String lastUpdated;

  static Company fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Company companyBean = Company();
    companyBean.id = map['id'];
    companyBean.avatar = map['avatar'];
    companyBean.name = map['name'];
    companyBean.description = map['description'];
    companyBean.establishedDate = map['establishedDate'];
    companyBean.email = map['email'];
    companyBean.mobile = map['mobile'];
    companyBean.fax = map['fax'];
    companyBean.website = map['website'];
    companyBean.officeType = map['officeType'];
    companyBean.addresslineone = map['addresslineone'];
    companyBean.addresslinetwo = map['addresslinetwo'];
    companyBean.country = map['country'];
    companyBean.state = map['state'];
    companyBean.zip = map['zip'];
    companyBean.createdBy = map['createdBy'];
    companyBean.lastUpdatedBy = map['lastUpdatedBy'];
    companyBean.dateCreated = map['dateCreated'];
    companyBean.lastUpdated = map['lastUpdated'];
    return companyBean;
  }

  Map toJson() => {
    "id": id,
    "avatar": avatar,
    "name": name,
    "description": description,
    "establishedDate": establishedDate,
    "email": email,
    "mobile": mobile,
    "fax": fax,
    "website": website,
    "officeType": officeType,
    "addresslineone": addresslineone,
    "addresslinetwo": addresslinetwo,
    "country": country,
    "state": state,
    "zip": zip,
    "createdBy": createdBy,
    "lastUpdatedBy": lastUpdatedBy,
    "dateCreated": dateCreated,
    "lastUpdated": lastUpdated,
  };
}