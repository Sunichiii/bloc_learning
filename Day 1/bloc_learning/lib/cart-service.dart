class CartService{
  double calculateTotal(List<double> prices){
    return prices.fold(0, (sum, price) => sum + price);
  }
}

// this is just a calculator nothing fancy haii
// fold bhaneko chai euta super powered calculator ho josle chai sabai element combine garcha
// fold bhaj




// working of fold

/* list.fold(pahilo_value, aaile list ma bhako item ) => naya value) */


