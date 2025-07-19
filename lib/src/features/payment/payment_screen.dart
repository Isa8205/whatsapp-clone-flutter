import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

// Class type definition
class TabItem {
  final String label;
  final Widget page;
  
  const TabItem({
    required this.label,
    required this.page
  });
}

List<TabItem> tabs = [
  TabItem(label: "Accounts", page: AccountsTab()),
  TabItem(label: "Cards", page: CardsTab()),
  TabItem(label: "Vault", page: VaultTab()),
  TabItem(label: "Wallet", page: WalletTab())
];

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}
class _PaymentScreenState extends State<PaymentScreen> {
  String activeTab = "Accounts";

  void setActiveTab(String tab) {
    setState(() {
      activeTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Find the widget for the active tab
    final Widget currentTabWidget = tabs.firstWhere(
          (tab) => tab.label == activeTab,
      orElse: () => TabItem(label: "Fallback", page: AccountsTab())
    ).page;

    return Scaffold(
      appBar: AppBar(
        title: const TitleBar(),
        backgroundColor: Colors.grey[100],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                hintText: "Search",
                prefixIcon: Icon(LucideIcons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            TopNavTabs(setActiveTab: setActiveTab), // ✅ pass function reference
            Container(
              padding: const EdgeInsets.all(5),
              child: currentTabWidget, // ✅ render active tab
            ),
          ],
        ),
      ),
    );
  }
}


class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.blueGrey
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "AY",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ),
          ),
          Row(
            children: [
              Icon(LucideIcons.chart_no_axes_column),
              SizedBox(width: 15,),
              Icon(LucideIcons.star),
              SizedBox(width: 15,),
              Icon(LucideIcons.bell),
              SizedBox(width: 15,)
            ],
          )
        ],
      ),
    );
  }
}

class TopNavTabs extends StatefulWidget {
  final Function(String) setActiveTab;

  const TopNavTabs({
    required this.setActiveTab,
    super.key,
  });

  @override
  State<TopNavTabs> createState() => _TopNavTabsState();
}

class _TopNavTabsState extends State<TopNavTabs> {
  String activeTabLabel = "Accounts";

  void setActiveTabLabel(String tabLabel) {
    setState(() {
      activeTabLabel = tabLabel;
      widget.setActiveTab(tabLabel); // ✅ pass just the label
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          for (var tab in tabs)
            InkWell(
              onTap: () => setActiveTabLabel(tab.label),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                decoration: BoxDecoration(
                  color: tab.label == activeTabLabel ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  tab.label,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// All the different tabs to be displayed
/// The accounts widget.
/// Shows simple layout for the account overview such as balance
class AccountsTab extends StatelessWidget {
  const AccountsTab({super.key});
  @override
  Widget build(BuildContext context) => const Text("Accounts Tab showing now");
}

class CardsTab extends StatelessWidget {
  const CardsTab({super.key});
  @override
  Widget build(BuildContext context) => const Text("Cards Tab");
}

class VaultTab extends StatelessWidget {
  const VaultTab({super.key});
  @override
  Widget build(BuildContext context) => const Text("Vault Tab");
}

class WalletTab extends StatelessWidget {
  const WalletTab({super.key});
  @override
  Widget build(BuildContext context) => const Text("Wallet Tab");
}
