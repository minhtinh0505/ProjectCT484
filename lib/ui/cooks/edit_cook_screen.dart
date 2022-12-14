import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cook.dart';
import 'cook_manager.dart';

class EditCookScreen extends StatefulWidget {
  static const routeName = '/edit-cook';

  EditCookScreen(
    Cook? cook, {
      super.key,
    }) {
      if(cook == null) {
        this.cook = Cook(
          id: null,
          title: '', 
          description: '', 
          img: '',
        );
      }else {
        this.cook = cook;
      }
    }
    late final Cook cook;

    @override
    State<EditCookScreen> createState() => _EditCookScreenState();
}

class _EditCookScreenState extends State<EditCookScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _editForm = GlobalKey<FormState>();
  late Cook _editedCook;
  var _isLoading = false;
  bool _isValidImageUrl(String value) {
    return (value.startsWith('http') || value.startsWith('https')) &&
      (value.endsWith('.png') ||
      value.endsWith('.jpg') ||
      value.endsWith('.jpeg'));
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(() {
      if(!_imageUrlFocusNode.hasFocus) {
        if(!_isValidImageUrl(_imageUrlController.text)) {
          return;
        }
        setState(() {});
      }
    });
    _editedCook = widget.cook;
    _imageUrlController.text = _editedCook.img;
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
    }

  Future<void> _saveForm() async {
    final isValid = _editForm.currentState!.validate();
    if(!isValid) {
      return;
    }
    _editForm.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    try{
      final cookManager = context.read<CookManager>();
      if(_editedCook.id != null) {
        cookManager.updatedCook(_editedCook);
      }else{
        cookManager.addCook(_editedCook);
      }
    } catch(error) {
      print(error);
    }

    setState(() {
      _isLoading = true;
    });

    if(mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Th??m m??n m???i'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _editForm,
          child: ListView(
            children: <Widget>[
              buildTitleField(),
              buildCookPreview(),
              buildDescriptionField(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTitleField() {
    return TextFormField(
      initialValue: _editedCook.title,
      decoration: const InputDecoration(labelText: 'T??n m??n'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Vui l??ng nh???p gi?? tr???.';
        }
        return null;
      },
      onSaved: (value) {
        _editedCook = _editedCook.copyWith(title: value);
      },
    );
  }

  TextFormField buildDescriptionField() {
    return TextFormField(
      initialValue: _editedCook.description,
      decoration: const InputDecoration(labelText: 'H?????ng d???n th???c hi???n'),
      maxLines: 10,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Vui l??ng nh???p d??? li???u.';
        }
        return null;
      },
      onSaved: (value) {
        _editedCook = _editedCook.copyWith(description: value);
      },
    );
  }

  Widget buildCookPreview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(
            top: 8,
            right: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _imageUrlController.text.isEmpty
            ? const Text('H??nh ???nh')
            : FittedBox(
              child: Image.network(
                _imageUrlController.text,
                fit: BoxFit.cover,
              ),
            ),
        ),
        Expanded(child: buildImageURLField(),),
      ],
    );
  }

  TextFormField buildImageURLField () {
    return TextFormField(
      decoration: const InputDecoration(labelText: ''),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.done,
      controller: _imageUrlController,
      focusNode: _imageUrlFocusNode,
      onFieldSubmitted: (value) => _saveForm(),
      validator: (value) {
        if(value!.isEmpty) {
          return 'Vui l??ng nh???p d??? li???u.';
        }
        if(!_isValidImageUrl(value)){
          return 'D??? li???u kh??ng h???p l???';
        }
        return null;
      },
      onSaved: (value) {
        _editedCook = _editedCook.copyWith(img: value);
      },
    );
  }
}