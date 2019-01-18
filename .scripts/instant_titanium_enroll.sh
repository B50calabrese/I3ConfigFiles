#!/bin/bash

# This script will put a test account into the Instant Titanium state.

if [ $# -lt 2 ]; then
    echo "Please specify a user id and challenge policy end time in seconds."
fi

# Sets HAS_TITANIUM_POLICY
stubby call --proto2 blade:gaia-ams AccountManagementService.UpdateAccount "header: < role: 'titanium-test-probers-on-owned-test-accounts' > gaia_id: $1 mutate: < operation: MUTATE_SERVICE_FLAGS mutate_service_flags_arguments: < mutation: < service_id: 596 change_type: ADD > > >"

# Sets STRONGAUTH
stubby call --proto2 blade:gaia-ams AccountManagementService.UpdateAccount "header: < role: 'titanium-test-probers-on-owned-test-accounts' > gaia_id: $1 mutate: < operation: MUTATE_SERVICE_FLAGS mutate_service_flags_arguments: < mutation: < service_id: 328 change_type: ADD > > >"

# Sets SMS_AUTH
stubby call --proto2 blade:gaia-ams AccountManagementService.UpdateAccount "header: < role: 'titanium-test-probers-on-owned-test-accounts' > gaia_id: $1 mutate: < operation: MUTATE_SERVICE_FLAGS mutate_service_flags_arguments: < mutation: < service_id: 270 change_type: ADD > > >"

# Sets the challenge policy grace period end time
stubby call --proto2 blade:gaia-ams AccountManagementService.UpdateAccount "header: < role: 'titanium-test-probers-on-owned-test-accounts' > gaia_id: $1 mutate: < operation: STRONG_AUTH_SET_CHALLENGE_POLICY_GRACE_PERIOD strong_auth_set_challenge_policy_grace_period_arguments: < end_time: < seconds: $2 > > >"
