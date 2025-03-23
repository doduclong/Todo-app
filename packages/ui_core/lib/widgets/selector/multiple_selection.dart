
import 'package:helper_package/src.dart';
import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyMultipleSelection extends StatelessWidget {

  final String title;
  final Future<List<MySelectionEntity>> Function(String) onQueryChanged;
  final Function(List<MySelectionEntity>) onSelectChanged;
  final Function()? onCallback;
  final List<MySelectionEntity> selectedList;
  final bool enable;
  final bool isMultipleSelect;
  final FormFieldValidator<String>? validator;
  final GlobalKey<FormFieldState>? formKeyForMySelectFiled;


  const MyMultipleSelection({required this.title,
    required this.onQueryChanged,
    required this.onSelectChanged,
    this.onCallback,
    required this.selectedList,
    this.enable = true,
    this.isMultipleSelect = true,
    this.validator,
    this.formKeyForMySelectFiled ,
  });

  Future<void> goToSearchScreen(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MySearchScreen(
        selectedList: selectedList,
        onQueryChanged: onQueryChanged,
        onCallback: onCallback,
        onSelectChanged: (tokens) {
          onSelectChanged.call(tokens);
        },
        isMultipleSelect: isMultipleSelect,
      );
    },
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  MyOpacity(
      enable: enable,
      child: MyVisibility(
        visible: isMultipleSelect,
        replacement: MySelectFiled(
          key: formKeyForMySelectFiled,
            validator: validator,
          onTap: () async {
            await goToSearchScreen(context);
          },
          icon: MyArtist.colorFilter.colorFilterSvg(
            size: 18,
            color: MyArtist.onSurface,
             MyAssets.icons.light.work,),
          title: title,
          detail: selectedList.isNotEmpty ?  selectedList.first.text : "",),
        child: MyGestureContainer(
          width: double.infinity,
          onTap: () {
            goToSearchScreen(context);
          },
          child: MyColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: MyStyle.text.textLargeSemiBold16,
              ),
              if (selectedList.isNotEmpty) const Gap(15),
              if (selectedList.isNotEmpty)
                MyWrap(
                  padding: EdgeInsets.zero,
                  children: [
                    for (final tag in selectedList)
                      IgnorePointer(
                          child: MyChip(
                        isSelect: true,
                        icon: MyAssets.icons.bold.calendar.svg(),
                        title: tag.text,
                      ),),
                  ],
                )
              else
                Text(
                  "${MyPackageInterpreter.letsSelect} $title",
                  style: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySearchScreen extends StatefulWidget {
  final bool isMultipleSelect;
  final Future<List<MySelectionEntity>> Function(String) onQueryChanged;
  final Function()? onCallback;
  final Function(List<MySelectionEntity>) onSelectChanged;
  final List<MySelectionEntity> selectedList;

  const MySearchScreen({
    super.key,
    required this.onQueryChanged,
    this.onCallback,
    required this.onSelectChanged,
    required this.isMultipleSelect,
    required this.selectedList,});

  @override
  State<StatefulWidget> createState() => _MySearchScreenState();
}

class _MySearchScreenState extends State<MySearchScreen> {
  List<MySelectionEntity> _list = [];
  List<MySelectionEntity> _selectedList = [];
  bool? isSuccess;

  Future<void> setList(String query) async {
    try {
      setState(() {
        isSuccess = null;
      });
      final List<MySelectionEntity> data = await widget.onQueryChanged.call(query);
      setState(() {
        _list = data.map((e) => MySelectionEntity(
          text: e.text,
          selected: _selectedList.map((e) => e.id).toList().contains(e.id),
          id: e.id,
        ),).toList();
        isSuccess = true;
      });
      setIsAllInSelected();
    } catch (e) {
      setState(() {
        _list = [];
        isSuccess = false;
      });
    }
  }

  void setIsAllInSelected(){
    setState(() {
      isAllInSelected = _list.where((element) => element.selected).toList().length == _list.length;
    });

  }

  @override
  void initState()  {
    super.initState();
    _selectedList = widget.selectedList;
    setList("");
  }

  Future<void> onChangeText(String text) async {
    await setList(text);
  }

  bool isAllInSelected = false;

  @override
  Widget build(BuildContext context) {
    return MyLayout(
      onWillPop: ()async{
        widget.onCallback?.call();
        return true;
      },
      appBar: MyAppBar(
        onCallback: widget.onCallback,
        actions: [
          MyVisibility(
            visible: widget.isMultipleSelect,
            replacement: Center(
              child: MyOnlyTextButton(
                text: MyPackageInterpreter.done,
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),
            ),
            child: Center(
              child: MyOnlyTextButton(
                text: isAllInSelected ? MyPackageInterpreter.unSelectAll : MyPackageInterpreter.selectAll,
                onTap: (){
                  setState(() {
                    isAllInSelected = !isAllInSelected;
                    _list = _list.map((e) => e.copyWith(selected: isAllInSelected),).toList();
                    _selectedList = _list.where((e) => e.selected).toList();
                  });
                  widget.onSelectChanged.call(_list);
                },
              ),
            ),
          ),
          const Gap(20),
        ],
      ),
      isUsedScrollView: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Container(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: MySingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MyPackageInterpreter.search, style: MyStyle.text.titleH1Bold26,),
                const Gap(15),
                MySearch(
                  isGrayColor: !MyArtist.isBrightnessLight,
                  margin: 0,
                  hintText: MyPackageInterpreter.search,
                  onChanged: onChangeText,
                ),
                const Gap(30),
                Text(MyPackageInterpreter.selectWhatYouWant, style: MyStyle.text.textLargeRegular16.copyWith(color: MyArtist.onSurface),),
                const Gap(15),
                MyListVerticalLoading(
                  margin: 0,
                  shrinkWrap: true,
                  isLoading: isSuccess == null,
                  child: isSuccess == true
                      ? MyWrap(
                    padding: EdgeInsets.zero,
                    children: [
                      for(final e in _list) MyChip(
                        isSelect: e.selected,
                        title: e.text,
                        onTap: (){
                          setState(() {
                            if(widget.isMultipleSelect) {
                              _list[_list.indexOf(e)] = e.copyWith(selected: !e.selected);
                            } else {
                              _list = _list.map((l) => e == l
                                  ? e.copyWith(selected: !e.selected)
                                  : l.copyWith(selected: false),).toList();
                            }
                            _selectedList = _list.where((e) => e.selected).toList();
                          });
                          setIsAllInSelected();
                          widget.onSelectChanged.call(_list);

                        },
                      ),
                    ],
                  )
                      : MyEmptyPage(
                    title: MyPackageInterpreter.connectToServerFailure,
                    detail: MyPackageInterpreter.connectToServerFailureDetail,
                  ),
                ),
              ],
            ),
          ),
        ),),
    );
  }
}

class MySelectionEntity {
  MySelectionEntity({
    required this.id,
    required this.text,
    required this.selected,
  });

  final String id;
  final String text;
  final bool selected;

  MySelectionEntity copyWith({
    String? id,
    String? text,
    bool? selected,
  }) =>
      MySelectionEntity(
        id: id ?? this.id,
        text: text ?? this.text,
        selected: selected ?? this.selected,
      );

  factory MySelectionEntity.fromJson(Map<String, dynamic> json) => MySelectionEntity(
        id: (json["id"]) as String,
        text: (json["text"]) as String,
        selected: (json["selected"]) as bool,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "selected": selected,
      };

}

