// Mocks generated by Mockito 5.3.0 from annotations
// in training_app/test/myanimelist/api_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;

import 'api_repository_test.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ApiRepositoryTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiRepositoryTest extends _i1.Mock implements _i2.ApiRepositoryTest {
  MockApiRepositoryTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> fetchAnime(String? searchparam) =>
      (super.noSuchMethod(Invocation.method(#fetchAnime, [searchparam]),
          returnValue: _i3.Future<dynamic>.value()) as _i3.Future<dynamic>);
}
