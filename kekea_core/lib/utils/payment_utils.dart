String getPaymentId(String paymentId) {
  if (paymentId != null) {
    if (paymentId.isNotEmpty) {
      return paymentId;
    }
  }
  return null;
}
