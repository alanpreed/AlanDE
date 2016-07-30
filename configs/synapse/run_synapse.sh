#! /bin/bash

# Synapse defaults to GNOME when it doesn't regognise the DE, which hides some useful applications. 
# For now, we tell it we are in Unity.  This hides lxde-only applications from lxsession, 
# but shows lxrandr, lxinput, lxappearance etc. This may need changing in future.
# To see what DE values synapse understands, see:
# http://bazaar.launchpad.net/~synapse-core/synapse-project/trunk/view/head:/src/core/desktop-file-service.vala

XDG_CURRENT_DESKTOP=unity synapse -s 