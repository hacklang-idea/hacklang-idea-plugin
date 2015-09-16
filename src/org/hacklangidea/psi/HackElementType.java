package org.hacklangidea.psi;

import com.intellij.psi.tree.IElementType;
import org.hacklangidea.lang.HackLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class HackElementType extends IElementType {
    public HackElementType(@NotNull @NonNls String debugName) {
        super(debugName, HackLanguage.INSTANCE);
    }
}
