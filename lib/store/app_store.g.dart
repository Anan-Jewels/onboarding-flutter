// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on AppBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'AppBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$stylesAtom = Atom(name: 'AppBase.styles', context: context);

  @override
  ObservableList<DesignStyles>? get styles {
    _$stylesAtom.reportRead();
    return super.styles;
  }

  @override
  set styles(ObservableList<DesignStyles>? value) {
    _$stylesAtom.reportWrite(value, super.styles, () {
      super.styles = value;
    });
  }

  late final _$initAsyncAction = AsyncAction('AppBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getDesignStylesAsyncAction =
      AsyncAction('AppBase.getDesignStyles', context: context);

  @override
  Future<void> getDesignStyles() {
    return _$getDesignStylesAsyncAction.run(() => super.getDesignStyles());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
styles: ${styles}
    ''';
  }
}
