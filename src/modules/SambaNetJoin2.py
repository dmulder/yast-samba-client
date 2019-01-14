from yast import Declare, ycpbuiltins, import_module
import_module('SambaAD')
from yast import SambaAD
from samba.net import Net, LIBNET_JOIN_AUTOMATIC
from samba.dcerpc import nbt
from samba import NTSTATUSError, ntstatus
from samba.param import LoadParm
from samba.credentials import Credentials

from samba.provision import (
    provision,
    ProvisioningError,
    DEFAULT_MIN_PWD_LENGTH,
    setup_path
)

# Joins the host into a given domain. If user is provided, it will use
# the user and password for joining. If the user is nil, joining will
# be done anonymously.
#
# Attention: It will write the configuration for domain before settings the password
#
# @param domain         a name of a domain to be joined
# @param join_level     level of a domain membership when joining ("member", "bdc" or "pdc")
# @param user           username to be used for joining, or nil for anonymous
# @param passwd         password for the user
# @param machine        machine account to join into (fate 301320)
# @return string        an error message or nil if successful
@Declare('string', 'string', 'string', 'string', 'string', 'string', 'string', 'string')
def Join(domain, join_level, user, passwd, machine, release_name, release_version):
    lp = LoadParm()
    lp.load_default()
    creds = Credentials()
    creds.guess(lp)
    creds.set_username(user)
    creds.set_password(passwd)
    server = SambaAD.ADS()

    net = Net(creds, lp, server=server)

    if machine == None:
        machine = lp.get("netbios name")

    if join_level == 'member':
        try:
            (join_password, sid, domain_name) = net.join_member(
                    domain, machine, LIBNET_JOIN_AUTOMATIC)
        except NTSTATUSError as e:
            ycpbuiltins.y2error(str(e))
            return str(e)
        ycpbuiltins.y2milestone("Joined domain %s (%s)" % (domain_name, sid))
    else:
        return 'Join level "%s" unknown' % join_level

