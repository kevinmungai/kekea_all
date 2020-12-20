import '../data/customer/customer.dart';

String getCustomer(Customer customer) {
  if (customer != null) {
    if (customer.phone != null) {
      return customer.phone;
    }
  }
  return "No Customer";
}
