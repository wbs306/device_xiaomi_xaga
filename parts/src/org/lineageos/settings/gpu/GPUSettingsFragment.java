/*
 * Copyright (C) 2018,2020 The LineageOS Project
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

package org.lineageos.settings.gpu;

import android.os.Bundle;

import androidx.preference.ListPreference;
import androidx.preference.Preference;
import androidx.preference.Preference.OnPreferenceChangeListener;
import androidx.preference.PreferenceFragment;

import org.lineageos.settings.R;

public class GPUSettingsFragment extends PreferenceFragment implements
        OnPreferenceChangeListener {

    private static final String PERF_GOVERNOR = "gpu_governor_perf";
    private static final String PERF_FREQUENCY = "gpu_max_frequency_perf";


    private ListPreference mGovernor;
    private ListPreference mFrequency;

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        addPreferencesFromResource(R.xml.gpu_settings);

        mGovernor = (ListPreference) findPreference(PERF_GOVERNOR);
        mGovernor.setOnPreferenceChangeListener(this);

        mFrequency = (ListPreference) findPreference(PERF_FREQUENCY);
        mFrequency.setOnPreferenceChangeListener(this);
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        switch (preference.getKey()) {
            case PERF_GOVERNOR:
                GPUUtils.setGPUGovernor(newValue.toString());
                return true;
            case PERF_FREQUENCY:
                GPUUtils.setGPUMaxFrequency(newValue.toString());
                return true;
            default:
                return false;
        }
    }
}
