from yast import Declare
from yast import ycpbuiltins
from samba.net import Net, LIBNET_JOIN_AUTOMATIC
from samba.param import LoadParm
from samba.credentials import Credentials

# Joins the host into a given domain. If user is provided, it will use
# the user and password for joining. If the user is nil, joining will
# be done anonymously.
#
# Attention: It will write the configuration for domain before settings the password
#
# @param domain a name of a domain to be joined
# @param join_level     level of a domain membership when joining ("member", "bdc" or "pdc")
# @param user           username to be used for joining, or nil for anonymous
# @param passwd         password for the user
# @param machine        machine account to join into (fate 301320)
# @return string        an error message or nil if successful
@Declare("string", "string", "string", "string", "string", "string", "string", "string")
def Join(domain, join_level, user, passwd, machine, release_name, release_version):
    lp = LoadParm()
    lp.load_default()

    creds = Credentials()
    creds.set_username(user)
    creds.set_password(passwd)
    creds.guess(lp)

    net = Net(creds, lp)

    if not machine:
        machine = lp.get("netbios name")

    try:
        (join_password, sid, domain_name) = net.join_member(domain, machine, LIBNET_JOIN_AUTOMATIC)
    except Exception as e:
        return str(e)
