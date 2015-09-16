package org.hacklangidea.lang;

import com.intellij.lang.Language;
import com.intellij.openapi.fileTypes.LanguageFileType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class HackLanguage extends Language {
    public static final Language INSTANCE = new HackLanguage();

    private HackLanguage() {
        super("hack");
    }

    @NotNull
    @Override
    public String getDisplayName() {
        return "HackLang";
    }

    @Nullable
    @Override
    public LanguageFileType getAssociatedFileType() {
        return HackFileType.INSTANCE;
    }

    @Override
    public boolean isCaseSensitive() {
        return true;
    }
}
