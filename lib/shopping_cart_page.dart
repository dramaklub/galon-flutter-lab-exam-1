import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  static const Color _primaryBlue = Color(0xFF2563EB);
  static const Color _lightBlue = Color(0xFFDBEAFE);
  static const Color _darkText = Color(0xFF0F172A);
  static const Color _subtleText = Color(0xFF64748B);
  static const Color _divider = Color(0xFFE2E8F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => debugPrint('Back clicked'),
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined, size: 26),
                  onPressed: () => debugPrint('Cart clicked'),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: _primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Introduction Section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _lightBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'CAMPUS STORE',
                  style: TextStyle(
                    color: _primaryBlue,
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Ready for checkout',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: _darkText,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Review your items before placing your order.',
                style: TextStyle(fontSize: 14, color: _subtleText),
              ),
              const SizedBox(height: 20),

              _buildDeliveryCard(),
              const SizedBox(height: 24),

              // Order Items Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Order Items',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: _darkText,
                    ),
                  ),
                  Text(
                    '3 items',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _subtleText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Product Cards
              const CartItemCard(
                name: 'Wireless Mouse',
                price: 'PHP 450.00',
                quantity: 1,
                icon: Icons.mouse_outlined,
              ),
              const SizedBox(height: 10),
              const CartItemCard(
                name: 'USB-C Hub',
                price: 'PHP 850.00',
                quantity: 1,
                icon: Icons.usb_rounded,
              ),
              const SizedBox(height: 10),
              const CartItemCard(
                name: 'Laptop Stand',
                price: 'PHP 700.00',
                quantity: 1,
                icon: Icons.laptop_mac_rounded,
              ),
              const SizedBox(height: 20),

              // Discount Banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDBEAFE)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.local_offer_outlined,
                        color: _primaryBlue,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'STUDENT10 applied',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: _darkText,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '10% discount on items',
                            style: TextStyle(
                              fontSize: 12,
                              color: _subtleText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.check_circle_rounded,
                      color: _primaryBlue,
                      size: 26,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Payment Summary
              _buildPaymentSummary(),
              const SizedBox(height: 20),

              // Place Order Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('Place order clicked! Total: PHP 1850.00');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryBlue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock_outline_rounded, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Place Order',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _divider),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.location_on_outlined,
              color: _primaryBlue,
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to Claudee Matthew Galon',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: _darkText,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Mandug, PS Building, Davao City',
                  style: TextStyle(fontSize: 13, color: _subtleText),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () =>
                debugPrint('Change delivery address clicked'),
            style: TextButton.styleFrom(
              foregroundColor: _primaryBlue,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Change',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Summary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: _darkText,
            ),
          ),
          const SizedBox(height: 16),
          _summaryRow('Subtotal', 'PHP 2,000.00'),
          const SizedBox(height: 10),
          _summaryRow('Discount (10%)', '- PHP 200.00'),
          const SizedBox(height: 10),
          _summaryRow('Delivery Fee', 'PHP 50.00'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(height: 1, color: _divider),
          ),
          _summaryRow('Total', 'PHP 1,850.00', isTotal: true),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w800 : FontWeight.w500,
            color: isTotal ? _darkText : _subtleText,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w900 : FontWeight.w600,
            color: _darkText,
          ),
        ),
      ],
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  static const Color _primaryBlue = Color(0xFF2563EB);
  static const Color _lightBlue = Color(0xFFDBEAFE);
  static const Color _darkText = Color(0xFF0F172A);
  static const Color _divider = Color(0xFFE2E8F0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _divider),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: _lightBlue,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: _primaryBlue, size: 30),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: _darkText,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => debugPrint('Remove item: $name'),
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Color(0xFF94A3B8),
                        size: 22,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      splashRadius: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: _primaryBlue,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _qtyButton(
                      icon: Icons.remove_rounded,
                      onPressed: () =>
                          debugPrint('Decrease quantity: $name'),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: _divider),
                      ),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: _darkText,
                        ),
                      ),
                    ),
                    _qtyButton(
                      icon: Icons.add_rounded,
                      onPressed: () =>
                          debugPrint('Increase quantity: $name'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 32,
      height: 32,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: _primaryBlue,
          side: const BorderSide(color: Color(0xFFBFDBFE), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size(32, 32),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}