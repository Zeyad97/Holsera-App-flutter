import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      decoration: BoxDecoration(gradient: AppColors.gradientBlue),
      child: Column(
        children: [
          Text(
            AppStrings.hero,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            AppStrings.heroSub,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 48),
          if (isMobile)
            _buildMobileFlow()
          else
            _buildDesktopFlow(),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF2563EB),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFlow() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildFlowItem('Buyer', '1'),
          const SizedBox(height: 16),
          const Icon(Icons.arrow_downward, color: Colors.white, size: 24),
          const SizedBox(height: 16),
          _buildFlowItem('Escrow', '2'),
          const SizedBox(height: 16),
          const Icon(Icons.arrow_downward, color: Colors.white, size: 24),
          const SizedBox(height: 16),
          _buildFlowItem('Seller', '3'),
        ],
      ),
    );
  }

  Widget _buildDesktopFlow() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFlowItem('Buyer', '1'),
          const Icon(Icons.arrow_forward, color: Colors.white, size: 32),
          _buildFlowItem('Escrow', '2'),
          const Icon(Icons.arrow_forward, color: Colors.white, size: 32),
          _buildFlowItem('Seller', '3'),
        ],
      ),
    );
  }

  Widget _buildFlowItem(String label, String number) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: Color(0xFF2563EB),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
