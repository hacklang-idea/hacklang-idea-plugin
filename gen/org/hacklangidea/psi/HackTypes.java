// This is a generated file. Not intended for manual editing.
package org.hacklangidea.psi;

import com.intellij.psi.tree.IElementType;
import com.intellij.psi.PsiElement;
import com.intellij.lang.ASTNode;
import org.hacklangidea.psi.impl.*;

public interface HackTypes {


  IElementType T_COMMENT = new HackTokenType("T_COMMENT");
  IElementType T_EXIT = new HackTokenType("T_EXIT");

  class Factory {
    public static PsiElement createElement(ASTNode node) {
      IElementType type = node.getElementType();
      throw new AssertionError("Unknown element type: " + type);
    }
  }
}
