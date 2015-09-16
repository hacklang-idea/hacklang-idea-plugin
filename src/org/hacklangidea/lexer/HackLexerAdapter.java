package org.hacklangidea.lexer;

import com.intellij.lexer.FlexAdapter;

import java.io.Reader;

public class HackLexerAdapter extends FlexAdapter {
    public HackLexerAdapter() {
        super(new HackLexer((Reader) null));
    }
}