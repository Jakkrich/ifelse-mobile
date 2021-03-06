import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../layer.dart';
import '../site.dart';
import '../page/product.dart';
import '../convert/product.dart';
import '../convert/util.dart';

class ProductParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, [Map<String, dynamic> par]) {
    return new ProductView(key: UniqueKey(), map: map, buildContext: buildContext, par: par);    
  }
  
  @override
  String get widgetName => 'product';
}

class ProductView extends StatefulWidget {
  final dynamic map;
  final BuildContext buildContext;
  final dynamic par;
  ProductView({Key key, this.map, this.buildContext, this.par}) : super(key: key);

  @override
  _ProductViewState createState() {
    //Site.log.w(_map);
    return new _ProductViewState(map, par);
  }
}
 
class _ProductViewState extends State<ProductView> {
  bool loaded;
  dynamic _map;
  dynamic _par;
  _ProductViewState(this._map, this._par) {
    //Site.log.w(_map);

  }

  @override
  void initState() {
    super.initState();
    //Site.log.w(' ---- state ---------------');
    loaded = false;
  }
 
  @override
  Widget build(BuildContext context) {    
    dynamic data = getVal(_map,'data');
    String spec = getVal(_map,'spec').toString();
    Map<String,String> request = {};
    request['limit'] = getInt(getVal(data,'limit')).toString();
    request['category'] = '';
    if(spec == 'auto') {
      dynamic category = getVal(_par,'category');
      if((category is List) && (category.length > 0)) {
        request['category'] = category.join(',');
      } else {
        request['category'] = category.toString();
      }
      request['status'] = getVal(_par,'staus') ?? '';
      request['tag'] = getVal(_par,'tag') ?? '';
      request['order'] = getVal(_par,'order') ?? '';
      request['skip'] = '0';
    } else {
      dynamic category = getVal(data,'category');
      if((category is List) && (category.length > 0)) {
        request['category'] = category.join(',');
      } else {
        request['category'] = category.toString();
      }
      request['status'] = getVal(data,'staus') ?? '';
      request['tag'] = getVal(data,'tag') ?? '';
      request['order'] = getVal(data,'order') ?? '';
      request['skip'] = getVal(data,'skip') ?? '';
    }

    return Center(
      child: Container(
        child: FutureBuilder<List<CellModel>>(
          future: Product.getList(request),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? snapshot.hasData
                    ? Product.getGrid(snapshot, _map, gridClicked)
                    : Product.retryButton(fetch)
                : Product.circularProgress();
          },
        ),
      ),
    );
  }
 
  setLoading(bool loading) {
    setState(() {
      loaded = loading;
    });
  }
 
  fetch() {
    setLoading(true);
  }
}
 
gridClicked(BuildContext context, CellModel cellModel) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(par:{'_id':getInt(cellModel.id,0)})));
}