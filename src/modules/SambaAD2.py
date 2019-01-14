from yast import Declare
from samba.net import Net
from samba.credentials import Credentials
from samba.dcerpc import nbt

# Check if a given workgroup is a Active Directory domain and return the name
# of AD domain controler
#
# @param workgroup      the name of a workgroup to be tested
# @return string        non empty when ADS was found
@Declare('string', 'string')
def GetDC(workgroup):
    creds = Credentials()
    net = Net(creds)
    cldap_ret = net.finddc(domain=workgroup, flags=(nbt.NBT_SERVER_LDAP | nbt.NBT_SERVER_DS))
    return cldap_ret.pdc_dns_name

