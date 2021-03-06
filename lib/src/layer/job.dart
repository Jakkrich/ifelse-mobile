import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../layer.dart';
import '../site.dart';
import '../page/job.dart';
import '../convert/job.dart';
import '../convert/util.dart';

class JobParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, [Map<String, dynamic> par]) {
    return new JobView(key: UniqueKey(), map: map, buildContext: buildContext, par: par);    
  }
  
  @override
  String get widgetName => 'job';
}

class JobView extends StatefulWidget {
  final dynamic map;
  final BuildContext buildContext;
  final dynamic par;
  JobView({Key key, this.map, this.buildContext, this.par}) : super(key: key);

  @override
  _JobViewState createState() {
    //Site.log.w(_map);
    return new _JobViewState(map, par);
  }
}
 
class _JobViewState extends State<JobView> {
  bool loaded;
  dynamic _map;
  dynamic _par;
  _JobViewState(this._map, this._par) {
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
    if(spec == 'auto') {
      request['order'] = getVal(_par,'order') ?? '';
      request['skip'] = '0';
    } else {
      request['order'] = getVal(data,'order') ?? '';
      request['skip'] = getVal(data,'skip') ?? '';
    }

    return Center(
      child: Container(
        child: FutureBuilder<List<CellModel>>(
          future: Job.getList(request),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? snapshot.hasData
                    ? Job.getGrid(snapshot, _map, gridClicked)
                    : Job.retryButton(fetch)
                : Job.circularProgress();
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
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => JobPage(par:{'_id':getInt(cellModel.id,0)})));
}