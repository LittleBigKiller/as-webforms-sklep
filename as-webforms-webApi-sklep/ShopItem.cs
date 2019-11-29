namespace as_webforms_sklep
{
    public class ShopItem
    {
        public string ProductId { get; set; }
        public int Amount { get; set; }
        public double Price { get; set; }

        public ShopItem(string productId, int amount, double price)
        {
            ProductId = productId;
            Amount = amount;
            Price = price;
        }
    }
}