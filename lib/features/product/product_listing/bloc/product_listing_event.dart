part of 'product_listing_bloc.dart';

abstract class ProductListingEvent {}

class LoadProductListingEvent extends ProductListingEvent {}

class OnTapNextEvent extends ProductListingEvent {
  final BuildContext context;

  OnTapNextEvent({required this.context});
}
