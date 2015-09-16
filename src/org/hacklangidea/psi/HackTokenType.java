package org.hacklangidea.psi;

import com.intellij.psi.tree.IElementType;
import org.hacklangidea.lang.HackLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import com.intellij.psi.tree.IElementType;

public class HackTokenType extends IElementType {
    public HackTokenType(@NotNull @NonNls String debugName) {
        super(debugName, HackLanguage.INSTANCE);
    }

    @Override
    public String toString() {
        return "HackTokenType." + super.toString();
    }
}
