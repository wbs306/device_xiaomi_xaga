/*
 * Copyright (C) 2023 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings.dolby;

import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

import com.android.settingslib.collapsingtoolbar.CollapsingToolbarBaseActivity;

public class DolbyActivity extends CollapsingToolbarBaseActivity {

    private static final String DAX_PACKAGE_NAME = "com.dolby.daxappui";
    private static final String DAX_ACTIVITY = "com.dolby.daxappui.MainActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // super.onCreate(savedInstanceState);

        ComponentName componentName = new ComponentName(DAX_PACKAGE_NAME, DAX_ACTIVITY);
        Intent intent = new Intent();
        intent.setComponent(componentName);
        startActivity(intent);
        // if (intent != null) {
        //     startActivity(intent);
        // } else {
        //     Toast.makeText(getApplicationContext(), "DaxUI not installed", Toast.LENGTH_SHORT).show();  
        // }
        
    }
}
