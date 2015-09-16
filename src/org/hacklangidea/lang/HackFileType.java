package org.hacklangidea.lang;

import com.intellij.openapi.fileTypes.LanguageFileType;
import org.hacklangidea.icons.HackIcons;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;

public class HackFileType extends LanguageFileType {
    public static final LanguageFileType INSTANCE = new HackFileType();

    public HackFileType() {
            super(HackLanguage.INSTANCE);
    }

    @NotNull
    @Override
    public String getName() {
        return "Hack file";
    }

    @NotNull
    @Override
    public String getDescription() {
        return "Hack Language file";
    }

    @NotNull
    @Override
    public String getDefaultExtension() {
        return "php";
    }

    @Nullable
    @Override
    public Icon getIcon() {
        return HackIcons.ICON;
    }
}
