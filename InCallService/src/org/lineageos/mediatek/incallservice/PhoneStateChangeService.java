package org.lineageos.mediatek.incallservice;

import android.telephony.TelephonyManager;

import android.content.Intent;
import android.content.IntentFilter;
import android.content.Context;
import android.app.Service;
import android.os.IBinder;

import android.util.Log;

public class PhoneStateChangeService extends Service {
    public static final String LOG_TAG = "MtkInCallService";

    private Context mContext;
    private PhoneStateChangeReceiver mPhoneStateChangeReceiver;

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startid) {
        mContext = this;
        mPhoneStateChangeReceiver = new PhoneStateChangeReceiver(mContext);

        Log.i(LOG_TAG, "Service is starting...");
        this.registerReceiver(mPhoneStateChangeReceiver,
                               new IntentFilter(TelephonyManager.ACTION_PHONE_STATE_CHANGED));
        return START_STICKY;
    }
}

