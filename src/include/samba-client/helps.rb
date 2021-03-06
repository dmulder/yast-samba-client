# encoding: utf-8

# ------------------------------------------------------------------------------
# Copyright (c) 2006-2012 Novell, Inc. All Rights Reserved.
#
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of version 2 of the GNU General Public License as published by the
# Free Software Foundation.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, contact Novell, Inc.
#
# To contact Novell about this file by physical or electronic mail, you may find
# current contact information at www.novell.com.
# ------------------------------------------------------------------------------

# File:	include/samba-client/helps.ycp
# Package:	Configuration of samba-client
# Summary:	Help texts of all the dialogs
# Authors:	Stanislav Visnovsky <visnov@suse.cz>
#
# $Id$
module Yast
  module SambaClientHelpsInclude
    def initialize_samba_client_helps(include_target)
      textdomain "samba-client"

      # All helps are here
      @HELPS = {
        # Read dialog help 1/2
        "read"                    => _(
          "<p><b><big>Initializing Samba Client Configuration</big></b><br>\n</p>\n"
        ) +
          # Read dialog help 2/2
          _(
            "<p><b><big>Aborting the Initialization</big></b><br>\nSafely abort the configuration utility by pressing <b>Abort</b>.</p>\n"
          ),
        # Write dialog help 1/2
        "write"                   => _(
          "<p><b><big>Saving Samba Client Configuration</big></b><br>\n</p>\n"
        ) +
          # Write dialog help 2/2
          _(
            "<p><b><big>Aborting Saving</big></b><br>\n" +
              "Abort the save procedure by pressing <b>Abort</b>.\n" +
              "An additional dialog informs you whether it is safe to do so.\n" +
              "</p>\n"
          ),
        # translators: Samba workgroup dialog help title
        "MembershipDialog_nocont" => _(
          "<p><b><big>Selecting Windows Domain Membership</big></b></p>"
        ) +
          # translators: Samba workgroup dialog help 1/3
          _(
            "<p>A Linux client can be a member of a workgroup, NT domain, or Active Directory domain.\nSpecify the name of the membership.</p>\n"
          ) +
          # Samba role dialog help 2/3
          _(
            "<p><b>Use SMB Information for Linux Authentication</b> allows \nverification of passwords with the NT server or the Kerberos server if joining an AD domain.</p>\n"
          ) +
          # Samba role dialog help 2.5/3
          _(
            "<p>Check <b>Change primary DNS suffix</b> to add your AD server into the list of name servers.\nThis option is only available for static network setups.</p>"
          ) +
          # Samba role dialog help 3/3
          _(
            "<p>When you press <b>OK</b>, the system verifies the membership and,\nif it is a NT or Active Directory domain, allows this host to join the domain.</p>\n"
          ),
        # translators: Samba membership dialog help title (installation)
        "MembershipDialog_cont"   => _(
          "<p><b><big>Selecting Windows Domain Membership</big></b></p>"
        ) +
          # translators: Samba membership dialog help 1/2 (installation)
          _("<p>Specify the name of the NT or Active Directory domain.</p>\n") +
          # translators: Samba membership dialog help 2/2 (installation)
          _(
            "<p>When you press <b>Next</b>, the system verifies the domain and\nallows this host to join the domain.</p>\n"
          ),
        # Samba membership dialog help (common part 1/4)
        "MembershipDialog_common" => _(
          "<p>Check <b>Create Home Directory on Login</b> to have local home directories created on the first login.</p>"
        ) +
          # Samba membership dialog help (common part 2/4)
          _(
            "<p><b>Offline Authentication</b> enables the user to log in even if there is no connection to the domain controller. For this option to work, you must log in to your domain at least once. The user's credentials are then stored encrypted on your computer and are reused for a domain login when no connection to the domain controller can be established. This is especially useful for mobile users."
          ) +
          # Samba membership dialog help (common part)
          _(
            "<p>Click <b>Expert Settings</b> to enable advanced features such as WINS options or mounting server home directories from Active Directory domains.</p>"
          ),
        # Samba membership dialog - additional help for autoyast config
        "MembershipDialog_config" => _(
          "<p><b>Join Settings</b></p>"
        ) +
          # Samba membership dialog - additional help for autoyast config
          _(
            "<p>Set the <b>Username</b> and <b>Password</b> that should be used for joining\nthe selected domain during autoinstallation. Note that the password will be saved to the profile in cleartext (unencrypted) form.</p>"
          ) +
          # Samba membership dialog - additional help for autoyast config
          _(
            "<p>Specify the <b>Active Directory Server</b> to use for joining an Active Directory domain. This is also used as the value for KDC in the Kerberos configuration.</p>"
          ),
        # Samba membership dialog - additional help for possible NTP configuration
        "MembershipDialog_NTP"    => _(
          "<p>\n" +
            "To synchronize your time with an NTP server, configure your computer\n" +
            "as an NTP client. Access the configuration with <b>NTP Configuration</b>.\n" +
            "</p>\n"
        )
      } 

      # EOF
    end
  end
end
