/////import 'package:edge3/update_password.dart';
import 'package:edge3/accounts/update_password.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            _buildSettingsOption(
              'Sounds',
              Icons.notifications,
              notificationsEnabled,
                  (value) => setState(() => notificationsEnabled = value),
              context,
            ),
            SizedBox(height: 20),
            _buildSettingsOption(
              'Dark mode',
              Icons.dark_mode,
              darkModeEnabled,
                  (value) => setState(() => darkModeEnabled = value),
              context,
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: (){
                                                                               //  scanQR();
                                                                               
              },
              child: _buildClickableOption(
                'Password',
                Icons.lock,
                    () {
                  // Navigate to the Password change screen or perform an action
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdatePassword()),
                  );*/
                },
                context,
              ),
            ),
            SizedBox(height: 20),
            _buildClickableOption(
              'Logout',
              Icons.logout,
                  () {
                // Perform logout action
                _showLogoutConfirmationDialog(context);
              },
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(
      String title,
      IconData icon,
      bool? toggleValue,
      ValueChanged<bool>? onToggle,
      BuildContext context,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF150B3D),
                fontSize: 16, // Matches font size in login
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        if (toggleValue != null && onToggle != null)
          Switch(
            value: toggleValue,
            onChanged: onToggle,
            activeColor: Colors.blue,
          ),
      ],
    );
  }

  Widget _buildClickableOption(String title, IconData icon, VoidCallback onTap, BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF150B3D),
                  fontSize: 16, // Matches font size in login
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
         title != "Password"? Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor): InkWell(
              onTap: (){
                                                                               //  scanQR();
                                                                               
              },
              child: Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor)), // Optional arrow icon
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners for the dialog
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Padding for the content
            child: Column(
              mainAxisSize: MainAxisSize.min, // Minimize size to fit content
              children: [
                Text(
                  'Logout',
                  style: TextStyle(
                    color: Color(0xFF150B3D),
                    fontSize: 18,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10), // Space below the title
                Text(
                  'Are you sure you want to logout?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF514A6B),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30), // Space before buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute buttons evenly
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(), // Cancel
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFFD6CDFE), // Color for Cancel button text
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Perform logout action here
                        Navigator.of(context).pop(); // Close dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0C73BB), // YES button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Add padding
                      ),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Space at the bottom
              ],
            ),
          ),
        );
      },
    );
  }

}


class Settings2 extends StatefulWidget {
  @override
  _Settings2State createState() => _Settings2State();
}

class _Settings2State extends State<Settings2> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(),
            ListTile(title: Text("Settings",style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10),
            _buildSettingsOption(
              'Notifications',
              Icons.notifications,
              notificationsEnabled,
                  (value) => setState(() => notificationsEnabled = value),
              context,
            ),
            SizedBox(height: 20),
            _buildSettingsOption(
              'Dark mode',
              Icons.dark_mode,
              darkModeEnabled,
                  (value) => setState(() => darkModeEnabled = value),
              context,
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: (){
                                                                               //  scanQR();
                                                                               
              },
              child: _buildClickableOption(
                'Password',
                Icons.lock,
                    () {
                  // Navigate to the Password change screen or perform an action
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdatePassword()),
                  );*/
                },
                context,
              ),
            ),
            SizedBox(height: 20),
            _buildClickableOption(
              'Logout',
              Icons.logout,
                  () {
                // Perform logout action
                _showLogoutConfirmationDialog(context);
              },
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(
      String title,
      IconData icon,
      bool? toggleValue,
      ValueChanged<bool>? onToggle,
      BuildContext context,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF150B3D),
                fontSize: 16, // Matches font size in login
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        if (toggleValue != null && onToggle != null)
          Switch(
            value: toggleValue,
            onChanged: onToggle,
            activeColor: Colors.blue,
          ),
      ],
    );
  }

  Widget _buildClickableOption(String title, IconData icon, VoidCallback onTap, BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF150B3D),
                  fontSize: 16, // Matches font size in login
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
         title != "Password"? Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor): InkWell(
              onTap: (){
                                                                               //  scanQR();
                                                                  
              },
              child: Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor)), // Optional arrow icon
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners for the dialog
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Padding for the content
            child: Column(
              mainAxisSize: MainAxisSize.min, // Minimize size to fit content
              children: [
                Text(
                  'Logout',
                  style: TextStyle(
                    color: Color(0xFF150B3D),
                    fontSize: 18,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10), // Space below the title
                Text(
                  'Are you sure you want to logout?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF514A6B),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30), // Space before buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute buttons evenly
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(), // Cancel
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFFD6CDFE), // Color for Cancel button text
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Perform logout action here
                        Navigator.of(context).pop(); // Close dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0C73BB), // YES button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Add padding
                      ),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Space at the bottom
              ],
            ),
          ),
        );
      },
    );
  }

}
