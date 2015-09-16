package org.hacklangidea.psi;


import com.intellij.extapi.psi.PsiFileBase;
import com.intellij.openapi.fileTypes.FileType;
import com.intellij.psi.FileViewProvider;
import org.hacklangidea.lang.HackFileType;
import org.hacklangidea.lang.HackLanguage;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;

public class HackFile extends PsiFileBase {
    public HackFile(@NotNull FileViewProvider viewProvider) {
        super(viewProvider, HackLanguage.INSTANCE);
    }

    @NotNull
    @Override
    public FileType getFileType() {
        return HackFileType.INSTANCE;
    }

    @Override
    public String toString() {
        return "Hack File";
    }

    @Override
    public Icon getIcon(int flags) {
        return super.getIcon(flags);
    }
}