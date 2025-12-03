import 'package:flutter/material.dart';

enum MuteDuration { hours24, week, always }

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // sample notifications data
  final List<_NotificationModel> _notifications = List.generate(
    20,
    (i) => _NotificationModel(
      title: i.isEven ? 'Live Invite' : 'Chat Invite',
      subtitle: i.isEven
          ? 'You have been invited to a live session.'
          : 'Someone messaged you to chat.',
      time: '${20 + i}:00 PM',
      isUnread: i % 3 == 0,
      type: i.isEven ? NotificationType.invite : NotificationType.message,
    ),
  );

  // used by mute dialog
  MuteDuration _selectedMute = MuteDuration.hours24;

  // show small popup menu under the settings icon
  void _showSettingsMenu(BuildContext context, Offset tapPosition) async {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final choice = await showMenu<String>(
      context: context,
      color: const Color(0xff1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      position: RelativeRect.fromRect(
        // position the menu around the tap point
        tapPosition & const Size(40, 40),
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(
          value: 'mute',
          child: _menuRow(Icons.volume_off, 'Mute Notifications'),
        ),
        PopupMenuItem(
          value: 'delete',
          child: _menuRow(Icons.delete_outline, 'Delete Notifications'),
        ),
      ],
    );

    if (choice == 'mute') {
      _showMuteDialog();
    } else if (choice == 'delete') {
      _showDeleteConfirmation();
    }
  }

  // small helper that builds the menu item row
  Widget _menuRow(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 10),
        Expanded(
          child: Text(label, style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  // Delete confirmation dialog
  Future<void> _showDeleteConfirmation() async {
    final result = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black54,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xff0F0F0F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: const Text(
            'Are you sure you want to delete all notifications?',
            style: TextStyle(color: Colors.white),
          ),
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff191919),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('No', style: TextStyle(color: Colors.white)),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4B3EFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => Navigator.pop(context, true),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Text('Yes', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        );
      },
    );

    if (result == true) {
      // perform deletion
      setState(() {
        _notifications.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All notifications deleted')),
      );
    }
  }

  // Mute options dialog (radio + Cancel/Mute)
  Future<void> _showMuteDialog() async {
    // temporary local variable to hold selection inside dialog
    MuteDuration tempSelection = _selectedMute;

    await showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {                              
            return AlertDialog(
              backgroundColor: const Color(0xff0F0F0F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: const Text(
                'Mute Notifications',
                style: TextStyle(color: Colors.white),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<MuteDuration>(
                    value: MuteDuration.hours24,
                    groupValue: tempSelection,
                    onChanged: (v) => setStateDialog(() => tempSelection = v!),
                    title: const Text(
                      '24 hours',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  RadioListTile<MuteDuration>(
                    value: MuteDuration.week,
                    groupValue: tempSelection,
                    onChanged: (v) => setStateDialog(() => tempSelection = v!),
                    title: const Text(
                      '1 week',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  RadioListTile<MuteDuration>(
                    value: MuteDuration.always,
                    groupValue: tempSelection,
                    onChanged: (v) => setStateDialog(() => tempSelection = v!),
                    title: const Text(
                      'Always',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
              actionsPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff191919),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4B3EFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // apply tempSelection
                    setState(() => _selectedMute = tempSelection);
                    Navigator.pop(context);
                    String label = _selectedMute == MuteDuration.hours24
                        ? 'Notifications muted for 24 hours'
                        : _selectedMute == MuteDuration.week
                        ? 'Notifications muted for 1 week'
                        : 'Notifications muted permanently';
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(label)));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    child: Text('Mute', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // UI for each notification tile, includes accept/decline for invites
  Widget _buildNotificationTile(_NotificationModel n) {
    final isInvite = n.type == NotificationType.invite;
    return ListTile(
      tileColor: Colors.transparent,
      leading: CircleAvatar(
        backgroundImage: const AssetImage('assets/pic1.jpg'),
        backgroundColor: Colors.grey[800],
      ),
      title: Text(
        n.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: isInvite ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
      subtitle: Text(n.subtitle, style: const TextStyle(color: Colors.white70)),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            n.time,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
          if (n.isUnread) const SizedBox(height: 6),
          if (n.isUnread)
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: Color(0xff4B3EFF),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: () {
        // open details or accept/decline depending on type
      },
    );
  }

  // header with Recents and gear icon; gear opens menu via onTapDown
  @override
  Widget build(BuildContext context) {
    Offset tapPosition = Offset.zero;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.maybePop(context),
                ),
                const Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Listener(
                  onPointerDown: (PointerDownEvent details) {
                    tapPosition = details.position;
                  },
                  child: IconButton(
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () => _showSettingsMenu(context, tapPosition),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // header row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: const [
                Text(
                  'Recents',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // list
          Expanded(
            child: _notifications.isEmpty
                ? const Center(
                    child: Text(
                      'No notifications',
                      style: TextStyle(color: Colors.white54),
                    ),
                  )
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _notifications.length,
                    separatorBuilder: (_, __) =>
                        const Divider(color: Colors.white12, height: 1),
                    itemBuilder: (context, index) {
                      final n = _notifications[index];
                      return Column(
                        children: [
                          _buildNotificationTile(n),
                          if (n.type ==
                              NotificationType
                                  .invite) // show action row for invites
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 8,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                          color: Color(0xff4B3EFF),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        // decline action
                                        setState(
                                          () => _notifications.removeAt(index),
                                        );
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text('Invite declined'),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Decline',
                                        style: TextStyle(
                                          color: Color(0xff4B3EFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xff4B3EFF,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        // accept
                                        setState(
                                          () => _notifications.removeAt(index),
                                        );
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text('Invite accepted'),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Accept',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

/// small local model to represent notifications
class _NotificationModel {
  final String title;
  final String subtitle;
  final String time;
  final bool isUnread;
  final NotificationType type;

  _NotificationModel({
    required this.title,
    required this.subtitle,
    required this.time,
    this.isUnread = false,
    this.type = NotificationType.message,
  });
}

enum NotificationType { message, invite }
