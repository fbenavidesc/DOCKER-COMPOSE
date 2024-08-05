#!/bin/bash
echo "
centralSRV2 =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = SERVER_CENTRAL_SRV2)(PORT = 1522))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = centralpdb)
    )
  )
scSRV1 =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = SERVER_SC_SRV1)(PORT = 1523))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = scpdb)
    )
  )
hrSRV2 =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = SERVER_HR_SRV2)(PORT = 1526))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = hrpdb)
    )
  )
" > /opt/oracle/oradata/network/admin/tnsnames.ora
