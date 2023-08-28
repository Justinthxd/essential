String calculateAmount(double income, double expense) {
  if ((income - expense) == 0) {
    return '0';
  }

  return (income - expense).toString();
}
